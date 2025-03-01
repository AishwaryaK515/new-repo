pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "aishwaryak2601/my-java-app:latest"
        DOCKER_CREDENTIALS = credentials('docker-hub-credentials')  // Add in Jenkins
    }

    tools {
        maven 'maven'   // Ensure Maven is installed in Jenkins Global Tool Configuration
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/AishwaryaK515/new-repo.git'
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
                echo $DOCKER_CREDENTIALS | docker login -u aishwaryak2601 --password-stdin
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
            echo "🚀 Deployment Successful!"
        }
        failure {
            echo "❌ Deployment Failed!"
        }
    }
}

