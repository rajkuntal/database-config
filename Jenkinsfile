pipeline {
  agent any
  stages {
    stage('db-change') {
      when {
        allOf {
          not { environment name: 'CHANGE_ID', value: '' }
        }
      }
      agent {
        docker {
          image 'mysql:5.7'
          args '-u root:sudo -e MYSQL_ROOT_PASSWORD=root -d'
        }
      }
      steps {
        sh 'apt-get update'
        sh 'apt-get -y install tar'
        sh 'apt-get -y install curl'
        sh 'service mysql restart'
        sh 'mysql -hlocalhost -uroot -proot -e "CREATE USER \'skeema\'@\'localhost\' IDENTIFIED BY \'skeemaPass\'; GRANT ALL PRIVILEGES ON *.* TO \'skeema\'@\'localhost\' WITH GRANT OPTION; CREATE USER \'skeema\'@\'%\' IDENTIFIED BY \'skeemaPass\'; GRANT ALL PRIVILEGES ON *.* TO \'skeema\'@\'%\' WITH GRANT OPTION;"'
        sh '''
          mkdir -p /tmp/skeema-ci/
          cd /tmp/skeema-ci
          curl -s -L https://github.com/skeema/skeema/releases/download/v1.4.3/skeema_1.4.3_linux_amd64.tar.gz > skeema.tar.gz
          tar xzf skeema.tar.gz skeema
        '''
        sh 'git checkout ${CHANGE_TARGET}'
        sh '/tmp/skeema-ci/skeema push skeema-diff-ci'
        sh 'git checkout ${CHANGE_BRANCH}'
        sh '/tmp/skeema-ci/skeema diff skeema-diff-ci | tee /tmp/skeema-ci/skeema-diff.sql'
        sleep(unit: 'SECONDS', time: 1)
      }
    }

  }
}