pipeline {
    agent any

    environment {
        IMAGE_NAME = "fake-ci-app"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/Anjalmaraskole/fake-ci-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $IMAGE_NAME:$BUILD_NUMBER .
                '''
            }
        }

        stage('Run & Test Container') {
            steps {
                sh '''
                docker run --rm $IMAGE_NAME:$BUILD_NUMBER
                '''
            }
        }

        stage('Cleanup Docker Image') {
            steps {
                sh '''
                docker rmi $IMAGE_NAME:$BUILD_NUMBER || true
                '''
            }
        }
    }

    post {
        success {
            echo "CI Pipeline completed successfully"
        }
        failure {
            echo "CI Pipeline failed"
        }
    }
}
