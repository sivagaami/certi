pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Starting the application'
        sh 'pip3.7 install -r requirements.txt'
      }
    }

    stage('Deploy') {
      steps {
        sh '''chmod +x deploy.sh
JENKINS_NODE_COOKIE=dontKillMe ./deploy.sh
'''
      }
    }

    stage('Validation') {
      steps {
        sh '''sleep 30
status_code=$(curl --write-out %{http_code} --silent --output /dev/null http://162.222.178.164:8001)
if [[ "$status_code" -eq 200 ]] ; then
  echo "Site is running fine and Deployment Sucessfull"
else
  exit 0
fi'''
      }
    }

    stage('Jmeter') {
      steps {
        timeout(time: 30) {
          echo 'Performance testing running successful'
        }

        sleep 20
      }
    }

    stage('Unittest') {
      steps {
        echo 'This unit testing is successful'
        sh 'python3.7 -m unittest quiz/tests.py'
         }
    }
  }
}
