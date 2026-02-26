pipeline {
    agent any

    environment {
        IMAGE_NAME = "gopikrishna09/node-app"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Gopikrishna398/dockerImg-node-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat '''
                docker build -t %IMAGE_NAME%:%BUILD_NUMBER% .
                '''
            }
        }

        stage('Stop Old Container') {
            steps {
                bat '''
                docker stop node-app-container || exit 0
                docker rm node-app-container || exit 0
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                bat '''
                docker run -d -p 3000:3000 --name node-app-container %IMAGE_NAME%:%BUILD_NUMBER%
                '''
            }
        }
    }
}