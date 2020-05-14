git diff master..test_pr_2 --name-only | tee /tmp/skeema-ci/dml-changes.txt
dmQueries="DML_Queries"
if grep -q "$dmQueries" /tmp/skeema-ci/dml-changes.txt; then
	echo '' >> /tmp/skeema-ci/skeema-diff.sql
	echo '' >> /tmp/skeema-ci/skeema-diff.sql
	echo '-- DML Queries' >> /tmp/skeema-ci/skeema-diff.sql
fi
while IFS="" read -r p || [ -n "$p" ]
do
  if [[ "$p" == *"DML_Queries"* ]]; then
  	cp -v "$p" /tmp/skeema-ci/"${p//\//_}"
  fi
done < /tmp/skeema-ci/dml-changes.txt
cat /tmp/skeema-ci/skeema-diff.sql /tmp/skeema-ci/DML_Queries*.sql | tee /tmp/skeema-ci/all_sql_changes.sql
