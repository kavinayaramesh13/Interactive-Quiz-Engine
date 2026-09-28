pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'python3 -m venv .venv'
                sh '. .venv/bin/activate && pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh '. .venv/bin/activate && pytest -q'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t interactive-quiz-engine:${BUILD_NUMBER} .'
            }
        }
    }

    post {
        success {
            echo 'CI pipeline completed successfully!'
        }

        failure {
            echo 'CI pipeline failed. Check the stage logs.'
        }
    }
}