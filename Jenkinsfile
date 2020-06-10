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
        script {
            sh("./scripts/db_changes.sh")
          }
        sleep(unit: 'SECONDS', time: 1)
      }
    }

  }
}