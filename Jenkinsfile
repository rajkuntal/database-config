pipeline {
		agent none
		stages {
      stage('Build here') {
          steps {
            echo 'hello outside'
          }
       }
			stage('Skeema-diff') {
        when {
          allOf {
            not { environment name: 'CHANGE_ID', value: '' }
            changeset "**/*.sql" 
          }
        }
        steps {
          echo 'hello inside sql changes'
        }
      } 
	 }
}