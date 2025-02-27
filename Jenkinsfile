pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "yourdockerhubuser/myapp:latest"
        DOCKER_CREDENTIALS = credentials('docker-hub-credentials')  // Stored in Jenkins credentials
    }

    tools {
        maven 'maven'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/AishwaryaK515/new-repo.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean package'
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $DOCKER_IMAGE .
                '''
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                sh '''
                echo $DOCKER_CREDENTIALS | docker login -u yourdockerhubuser --password-stdin
                docker push $DOCKER_IMAGE
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
            }
        }
    }

    post {
        success {
            echo "Deployment Successful!"
        }
        failure {
            echo "Deployment Failed!"
        }
    }
}

