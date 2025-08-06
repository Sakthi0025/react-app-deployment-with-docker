pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Sakthi0025/react-app-deployment-with-docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("sakthi-image")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove existing container if already running
                    sh "docker rm -f sakthi-container || true"

                    // Run the new container
                    sh "docker run -d -p 80:80 --name sakthi-container sakthi-image"
                }
            }
        }
    }
}
