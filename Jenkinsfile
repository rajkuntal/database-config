pipeline {
  agent {
    docker {
      image 'mysql:5.7'
    }

  }
  stages {
    stage('db-change') {
      steps {
        ws(dir: '/tmp/codebase/')
        sh 'mysql -hlocalhost -uroot -proot'
      }
    }

  }
  environment {
    MYSQL_ROOT_PASSWORD = 'root'
  }
}