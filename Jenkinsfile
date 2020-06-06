pipeline {
  agent any
  stages {
    stage('db-change') {
      agent {
        docker {
          image 'mysql:5.7'
          args '-u root:sudo -e MYSQL_ROOT_PASSWORD=root -d'
        }

      }
      when {
        allOf {
          not {
            environment name: 'CHANGE_ID', value: ''
          }

        }

      }
      steps {
        sh 'apt-get update'
        sh 'apt-get -y install tar'
        sh 'apt-get -y install curl'
        sh 'apt-get -y install git'
        sh 'service mysql restart'
        sh 'mysql -hlocalhost -uroot -proot -e "CREATE USER \'skeema\'@\'localhost\' IDENTIFIED BY \'skeemaPass\'; GRANT ALL PRIVILEGES ON *.* TO \'skeema\'@\'localhost\' WITH GRANT OPTION; CREATE USER \'skeema\'@\'%\' IDENTIFIED BY \'skeemaPass\'; GRANT ALL PRIVILEGES ON *.* TO \'skeema\'@\'%\' WITH GRANT OPTION;"'
        sh '''
          mkdir -p /tmp/skeema-ci/
          cd /tmp/skeema-ci
          curl -s -L https://github.com/skeema/skeema/releases/download/v1.4.3/skeema_1.4.3_linux_amd64.tar.gz > skeema.tar.gz
          tar xzf skeema.tar.gz skeema
        '''
        sh '''            cd /tmp/skeema-ci/
            curl -s -L https://github.com/github/hub/releases/download/v2.12.3/hub-linux-amd64-2.12.3.tgz > hub-linux-amd64-2.12.3.tgz
            tar xzf hub-linux-amd64-2.12.3.tgz hub-linux-amd64-2.12.3/bin/hub
            mv hub-linux-amd64-2.12.3/bin/hub hub'''
        sh 'git checkout ${CHANGE_TARGET}'
        sh '/tmp/skeema-ci/skeema push skeema-diff-ci'
        sh 'git checkout remotes/origin/${CHANGE_BRANCH}'
        sh '/tmp/skeema-ci/skeema diff skeema-diff-ci | tee /tmp/skeema-ci/skeema-diff.sql'
        sleep(unit: 'SECONDS', time: 1)
        sh '''if [ -s /tmp/skeema-ci/skeema-diff.sql ] ; then
            sed -i \'s/-- instance: 127.0.0.1:3306/-- skeema-diff-comment \\
            \\
            ```sql \\
            -- ddl queries /g\' /tmp/skeema-ci/skeema-diff.sql
            touch /tmp/skeema-ci/skeema-diff-exists-hint.hint
          else
            echo $\'-- skeema-diff-comment \\n\\n ```sql \' >> /tmp/skeema-ci/skeema-diff.sql
          fi'''
        sh '''magic_comment_hint="-- skeema-diff-comment"
          magic_comment_id=$(/tmp/skeema-ci/hub api "/repos/rajkuntal/database-config/issues/17/comments?per_page=100" | jq -r ".[] | select(.body | startswith(\\"${magic_comment_hint}\\")) | .id" | head -n 1)
          if [ -z "$magic_comment_id" ] ; then
            /tmp/skeema-ci/hub api "/repos/rajkuntal/database-config/issues/17/comments" --raw-field "body=$(cat /tmp/skeema-ci/skeema-diff.sql)"
          else
            /tmp/skeema-ci/hub api --method PATCH "/repos/rajkuntal/database-config/issues/comments/${magic_comment_id}" --raw-field "body=$(cat /tmp/skeema-ci/skeema-diff.sql)"
          fi'''
      }
    }

  }
}