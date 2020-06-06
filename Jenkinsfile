pipeline {
    agent any
    stages {
      stage('Skeema-diff') {
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
          sh 'service mysql restart'
          sh 'mysql -hlocalhost -uroot -proot'
          sh 'logout'
        }
      }
    }
  }