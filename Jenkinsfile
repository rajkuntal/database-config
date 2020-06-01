pipeline {
		agent any 
		stages {
			stage('Skeema-diff') {
				agent {
                	docker {
                		image 'mysql/mysql-server'
                		args '--name some-mysql -e MYSQL_ROOT_PASSWORD=root -d'
                	}
            	}
				steps {
					sh '''
						mkdir -p /tmp/skeema-ci/
          				cd /tmp/skeema-ci/
          				curl -s -L https://github.com/github/hub/releases/download/v2.12.3/hub-linux-amd64-2.12.3.tgz > hub-linux-amd64-2.12.3.tgz
          				tar xzf hub-linux-amd64-2.12.3.tgz hub-linux-amd64-2.12.3/bin/hub
          				mv hub-linux-amd64-2.12.3/bin/hub hub
          				'''
          			sh '''
          				cd /tmp/skeema-ci
            			curl -s -L https://github.com/github/skeema/releases/download/v1.3.0-gh/skeema_1.3.0_linux_amd64.tar.gz > skeema.tar.gz
            			tar xzf skeema.tar.gz skeema
            			'''
            		sh 'sudo service mysql restart'
            		sh '/tmp/skeema-ci/skeema push skeema-diff-ci'
				}
			}
		}
	}