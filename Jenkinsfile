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
        sh 'service mysql restart'
        sh 'mysql -hlocalhost -uroot -proot <<< "show databases;"'
      }
    }

  }
}