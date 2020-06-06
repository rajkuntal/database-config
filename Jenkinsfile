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
      steps {
        sh 'apt-get update'
        sh 'apt-get -y install tar'
        sh 'apt-get -y install curl'
        sh 'service mysql restart'
        sh 'mysql -hlocalhost -uroot -proot -e "CREATE USER \'monty\'@\'localhost\' IDENTIFIED BY \'some_pass\'; GRANT ALL PRIVILEGES ON *.* TO \'monty\'@\'localhost\' WITH GRANT OPTION; CREATE USER \'monty\'@\'%\' IDENTIFIED BY \'some_pass\'; GRANT ALL PRIVILEGES ON *.* TO \'monty\'@\'%\' WITH GRANT OPTION;"'
        sh '''
          mkdir -p /tmp/skeema-ci/
          cd /tmp/skeema-ci
          curl -s -L https://github.com/skeema/skeema/releases/download/v1.4.3/skeema_1.4.3_linux_amd64.tar.gz > skeema.tar.gz
          tar xzf skeema.tar.gz skeema
        '''
        sleep(unit: 'SECONDS', time: 1)
        sh '/tmp/skeema-ci/skeema push skeema-diff-ci'
      }
    }

  }
}