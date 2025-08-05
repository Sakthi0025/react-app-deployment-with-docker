Yaapipeline {
    agent any

    stages {
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Changing Permission') {
            steps {
                sh 'chmod +x build.sh'
            }
        }

        stage('Executing Script') {
            steps {
                sh './build.sh'
            }
        }
    }
}
