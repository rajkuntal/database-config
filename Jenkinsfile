pipeline {
		agent any
		stages {
      stage('Build here') {
        agent {
          docker {
            image 'mysql:latest'
            args '-u root:sudo -e MYSQL_ROOT_PASSWORD=root -d'
          }
          steps {
            sh 'git checkout $CHANGE_TARGET'
          }
        }
      }
			stage('Skeema-diff') {
        when {
          allOf {
            not { environment name: 'CHANGE_ID', value: '' }
            // changeset "*.sql" 
          }
        }
        steps {
          echo 'hello inside sql changes'
        }
      } 
	 }
}