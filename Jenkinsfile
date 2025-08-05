pipeline {
    agent any

    stages {
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Changing the file permission') {
            steps {
                sh 'chmod +x build.sh'
            }
        }

        stage('Executing the file') {
            steps {
                sh './build.sh'
            }
        }
    }
}
