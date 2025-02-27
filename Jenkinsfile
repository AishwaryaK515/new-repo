pipeline {
    agent any

    tools {
        maven 'maven'  // Ensure this matches the name in Global Tool Configuration
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/AishwaryaK515/new-repo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn --version'  // Verify Jenkins is using the correct Maven version
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying the application..."
            }
        }
    }
}

