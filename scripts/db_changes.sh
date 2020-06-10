mkdir -p /tmp/skeema-ci/
cd /tmp/skeema-ci
curl -s -L https://github.com/skeema/skeema/releases/download/v1.4.3/skeema_1.4.3_linux_amd64.tar.gz > skeema.tar.gz
tar xzf skeema.tar.gz skeema

cd /tmp/skeema-ci/
curl -s -L https://github.com/github/hub/releases/download/v2.12.3/hub-linux-amd64-2.12.3.tgz > hub-linux-amd64-2.12.3.tgz
tar xzf hub-linux-amd64-2.12.3.tgz hub-linux-amd64-2.12.3/bin/hub
mv hub-linux-amd64-2.12.3/bin/hub hub
git checkout ${CHANGE_TARGET}
/tmp/skeema-ci/skeema push skeema-diff-ci
git checkout PR-${CHANGE_ID}
/tmp/skeema-ci/skeema diff skeema-diff-ci | tee /tmp/skeema-ci/skeema-diff.sql
if [ -s /tmp/skeema-ci/skeema-diff.sql ] ; then
  echo '-- skeema-diff-comment' >> /tmp/skeema-ci/sql-change.sql
  echo '' >> /tmp/skeema-ci/skeema-diff.sql
  echo '```sql' >> /tmp/skeema-ci/sql-change.sql
  sed -i 's/-- instance: localhost:3306//g' /tmp/skeema-ci/skeema-diff.sql
  cat /tmp/skeema-ci/skeema-diff.sql >> /tmp/skeema-ci/sql-change.sql
fi

(git fetch origin ${CHANGE_TARGET}:${CHANGE_TARGET}) && (git diff --name-only ${CHANGE_TARGET}) | tee /tmp/skeema-ci/dml-changes.txt
while IFS="" read -r filePath || [ -n "$filePath" ]
    do
      if [[ ("$filePath" == *"/resources/db/predeploy"*) || ("$filePath" == *"/resources/db/postdeploy"*) ]]; then
        cp -v "$filePath" /tmp/skeema-ci/dml_query_$counter.sql
        if [[ $counter == 2 ]]; then
          echo '' >> /tmp/skeema-ci/sql-change.sql
          echo -- dml queries >> /tmp/skeema-ci/sql-change.sql
        fi
      fi
    counter=$(( $counter + 1 ))
  done < /tmp/skeema-ci/dml-changes.txt
  cat /tmp/skeema-ci/sql-change.sql /tmp/skeema-ci/dml_query_*.sql | tee /tmp/skeema-ci/all_sql_changes.sql

magic_comment_hint="-- skeema-diff-comment"
magic_comment_id=$(/tmp/skeema-ci/hub api "/repos/rajkuntal/database-config/issues/17/comments?per_page=100" | jq -r ".[] | select(.body | startswith(\\"${magic_comment_hint}\\")) | .id" | head -n 1)
if [ -z "$magic_comment_id" ] ; then
  /tmp/skeema-ci/hub api "/repos/rajkuntal/database-config/issues/17/comments" --raw-field "body=$(cat /tmp/skeema-ci/all_sql_changes.sql)"
else
  /tmp/skeema-ci/hub api --method PATCH "/repos/rajkuntal/database-config/issues/comments/${magic_comment_id}" --raw-field "body=$(cat /tmp/skeema-ci/all_sql_changes.sql)"
fi