pipeline {
		agent none
		stages {
      stage('Build here') {
          steps {
            echo 'hello outside'
            sh 'echo ${CHANGE_ID}'
            sh 'echo ${CHANGE_TARGET}'
            echo "${env.CHANGE_BRANCH}"
            echo "${env.CHANGE_ID}"
            sh 'git checkout $CHANGE_TARGET'
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