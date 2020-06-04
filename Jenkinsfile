pipeline {
		agent none
		stages {
      stage('Build here') {
          steps {
            echo 'hello outside'
          }
       }
			stage('Skeema-diff') {
        when { environment name: 'CHANGE_ID', value: '' }
        steps {
            echo 'hello inside sql changes'
			 }
		}
	}
}