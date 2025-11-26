pipeline {
    agent any

    tools {
        maven 'Maven3'    // Nom configuré dans Jenkins
        jdk 'JDK17'
    }

    environment {
        IMAGE_NAME = 'hamouda/student-management:latest'  // Nom de ton image Docker
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/hamouda0esprit/DEVOPS.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile -DskipTests'
            }
        }

        stage('Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker run -d -p 8080:8080 $IMAGE_NAME'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Application déployée via Docker'
            }
        }
    }

    post {
        always {
            echo 'Pipeline terminée.'
        }
    }
}
