pipeline {
    agent any
      /*
      options {
          skipDefaultCheckout true
      } 
      */
    stages {
      stage('Skeema-diff') {
        when {
          allOf {
            not { environment name: 'CHANGE_ID', value: '' }
            // changeset "**/*.sql"
          }
        }
        agent {
          docker {
            image 'mysql:5.7'
            args '-u root:sudo -e MYSQL_ROOT_PASSWORD=root -d'
          }
        /*
        options {
          skipDefaultCheckout true
        } 
        */
        }
        steps {
          sh 'mysql -hlocalhost -uroot -proot'
          sh 'logout'
        }
      }
    }
  }