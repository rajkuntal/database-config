pipeline {
		agent none
		stages {
      stage('Build here') {
          steps {
            echo 'hello outside'
          }
       }
			stage('Skeema-diff') {
        steps {
            when { environment name: 'CHANGE_ID', value: '' }
            echo 'hello inside sql changes'
			 }
		}
	}
}