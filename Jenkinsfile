pipeline {
    agent any
    environment {
        IMAGE_NAME = "flask-selenium-test"
    }
    stages {
        // 🚫 Remove 'Clone Repo' – Jenkins already checks out the code via Pipeline SCM
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
            sh 'docker system prune -af || true'
        }
    }
}
