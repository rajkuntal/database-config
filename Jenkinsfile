pipeline {
		agent none
		stages {
			stage('Skeema-diff') {
        steps {
        when {
          allOf
              {
                environment name: 'CHANGE_ID', value: '';
                changeset "*.sql"
              }
          }
          echo 'hello inside sql changes'
			}
		}
	}
}