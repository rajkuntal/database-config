pipeline {
		agent none
		stages {
      stage('Build here') {
          steps {
            echo 'hello outside'
          }
       }
			stage('Skeema-diff') {
        when { changeset "**/*.sql" }
        steps {
            echo 'hello inside sql changes'
			 }
		}
	}
}