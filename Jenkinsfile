pipeline {
    agent { label 'master' }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t akash/node-web-app .'
            }
        }
        stage('Deploy') {
            steps {
                timeout(time: 3, unit: 'MINUTES') {
                    retry(5) {
                        sh 'docker run -p 3002:3001 -d akash/node-web-app'
                    }
                }
            }
        }
        stage('Test') {
            steps {
                sh 'curl -i localhost:3002'
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}
