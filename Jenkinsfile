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
        sleep(unit: 'MINUTES', time: 2)
        sh 'mysql -hlocalhost -uroot -proot -e "show databases;"  >> /tmp/databases.txt'
        readFile '/tmp/databases.txt'
      }
    }

  }
}