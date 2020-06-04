pipeline {
		agent none
		stages {
			stage('Skeema-diff') {
        steps {
            when { environment name: 'CHANGE_ID', value: '' }
            echo 'hello inside sql changes'
			 }
       steps {
          echo 'hello outside'
       }
		}
	}
}