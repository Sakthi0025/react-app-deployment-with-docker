pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning the repository..."
                // Already cloned in Freestyle jobs — skip if needed
            }
        }

        stage('Build React App') {
            steps {
                echo "Running build.sh..."
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t sakthi0025/react-app:latest .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo "Pushing Docker image to DockerHub..."
                sh 'docker push sakthi0025/react-app:latest'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker container..."
                sh 'docker stop react-app || true'
                sh 'docker rm react-app || true'
                sh 'docker run -d -p 3000:3000 --name react-app sakthi0025/react-app:latest'
            }
        }
    }
}
