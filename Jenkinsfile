pipeline {
    agent any
    environment {
        IMAGE_NAME = "flask-selenium-test"
    }
    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/WahidaSaliha/python-getting-started.git'
            }
        }

        stage('Linting') {
            steps {
                sh 'pip install flake8 && flake8 app.py || true'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'docker run --rm $IMAGE_NAME'
            }
        }
    }
    post {
        always {
            sh 'docker system prune -af'
        }
    }
}
