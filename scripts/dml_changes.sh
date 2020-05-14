if [ -f /tmp/skeema-ci/skeema-diff-exists-hint.hint ] ; then
          # There is a schema change
          if [ -f /tmp/skeema-ci/skeema-diff-label-detected.hint ] ; then
            curl -X POST -u rajkuntal:798uoonsdfnjkghkj \
              "https://api.github.com/repos/rajkuntal/database-config/issues/11/labels" \
              -H "Content-type: application/json" -H "Accept: application/json" -d '["skeema-diff"]'
            touch /tmp/skeema-ci/skeema-diff-label-created.hint
          fi
        else
          if [ ! -f /tmp/skeema-ci/skeema-diff-label-detected.hint ] ; then
            # remove existing label
            /tmp/skeema-ci/hub api --method DELETE "/repos/rajkuntal/database-config/issues/${PR_NUMBER}/labels/skeema-diff" || :
            touch /tmp/skeema-ci/skeema-diff-label-removed.hint
          fi
        fi