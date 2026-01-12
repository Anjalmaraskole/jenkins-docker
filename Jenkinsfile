pipeline {
    agent any

    environment {
        IMAGE_NAME = "fake-ci-app"
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo "📥 Code checked out from GitHub"
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
                docker rmi $IMAGE_NAME:$BUILD_NUMBER
                '''
            }
        }
    }

    post {
        success {
            echo "✅ CI pipeline completed successfully"
        }
        failure {
            echo "❌ CI pipeline failed"
        }
        always {
            echo "🧹 Pipeline finished"
        }
    }
}
