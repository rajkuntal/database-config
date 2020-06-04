pipeline {
		agent none 
    options { 
          skipDefaultCheckout(true) 
        }
		stages {
			stage('Skeema-diff') {
        steps {
        when {
          allOf
              {
                environment name: 'CHANGE_ID', value: ''
                changeset '*.sql'
              }
          }
          echo 'hello inside sql changes'
			}
		}
	}
}