pipeline {
  agent {
    docker {
      image 'mysql:5.7'
    }

  }
  stages {
    stage('db-change') {
      steps {
        sh 'mysql -hlocalhost -uroot -proot'
      }
    }

  }
  environment {
    MYSQL_ROOT_PASSWORD = 'root'
  }
}