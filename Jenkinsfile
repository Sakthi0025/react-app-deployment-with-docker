pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDS = credentials('dockerhub-creds')
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/sakthi0025/your-repo-name.git' // replace with your actual repo
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("sakthi0025/myapp:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
