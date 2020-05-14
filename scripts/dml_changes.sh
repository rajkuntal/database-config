if [ -s /tmp/skeema-ci/skeema-diff.sql ] ; then
	sed -i "" 's/-- instance: 127.0.0.1:3306/-- skeema-diff-comment \
	\
	```sql \
	-- ddl queries /g' /tmp/skeema-ci/skeema-diff.sql
	touch /tmp/skeema-ci/skeema-diff-hint.hint
else
	echo '-- skeema-diff-comment \n\n ```sql ' >> /tmp/skeema-ci/skeema-diff.sql
fi