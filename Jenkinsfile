pipeline {
    agent any

    tools {
        maven 'Maven3'   // Nom de ton installation Maven dans Jenkins
        jdk 'JDK17'      // Nom de ton JDK dans Jenkins
    }

    environment {
        PATH = "/usr/local/bin:$PATH"  // Si besoin d'ajouter Docker au PATH
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/hamouda0esprit/DEVOPS.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar') { // Nom configuré dans Jenkins
                    sh 'mvn clean verify sonar:sonar -Dsonar.login=$SONAR_TOKEN'
                }
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

    post {
        always {
            echo 'Pipeline terminé.'
        }
        success {
            echo 'Pipeline réussi.'
        }
        failure {
            echo 'Pipeline échoué.'
        }
    }
}
