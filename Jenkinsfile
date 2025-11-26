pipeline {
    agent any

    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }

    environment {
        PATH = "/usr/local/bin:$PATH"  // Ajoute Docker au PATH
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/hamouda0esprit/DEVOPS.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t hamouda/student-management:latest .'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker run -d -p 8080:8080 hamouda/student-management:latest'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Déploiement terminé.'
            }
        }
    }
}
