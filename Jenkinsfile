pipeline {
  agent {
    docker {
      image 'mysql:5.7'
      args '-e MYSQL_ROOT_PASSWORD=root'
    }

  }
  stages {
    stage('db-change') {
      steps {
        sh 'mysql -hlocalhost -uroot -proot'
      }
    }

  }
}