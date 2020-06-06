pipeline {
    agent any
    stages {
      stage('Skeema-diff') {
        when {
          allOf {
            not { environment name: 'CHANGE_ID', value: '' }
          }
        }
        agent {
          docker {
            image 'mysql:5.7'
            args '-u root:sudo -e MYSQL_ROOT_PASSWORD=root -d'
          }
        }
        steps {
          sh 'apt-get update'
          sh 'apt-get -y install tar'
          sh 'apt-get -y install curl'
          sh 'service mysql restart'
          sh 'mysql -hlocalhost -uroot -proot'
          sh '''
              mkdir -p /tmp/skeema-ci/
              cd /tmp/skeema-ci/
              curl -s -L https://github.com/github/hub/releases/download/v2.12.3/hub-linux-amd64-2.12.3.tgz > hub-linux-amd64-2.12.3.tgz
              tar xzf hub-linux-amd64-2.12.3.tgz hub-linux-amd64-2.12.3/bin/hub
              mv hub-linux-amd64-2.12.3/bin/hub hub
            '''
          sh '/tmp/skeema-ci/skeema push skeema-diff-ci'
          sh '/tmp/skeema-ci/skeema diff skeema-diff-ci | tee /tmp/skeema-ci/skeema-diff.sql'
        }
      }
    }
  }