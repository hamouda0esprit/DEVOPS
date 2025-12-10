pipeline {
    agent any

    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }

    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:$PATH"
        IMAGE_NAME = "hamouda/student-management"
        CONTAINER_NAME = "student-management-app"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/hamouda0esprit/DEVOPS.git'
            }
        }

        stage('SonarQube Analysis') {
            environment {
                SONAR_TOKEN = credentials('squ_457d32ccd17e206c3b2ef68e2bfc1a0e4801759f')  
            }
            steps {
                sh '''
                mvn sonar:sonar \
                    -Dsonar.projectKey=student-management \
                    -Dsonar.host.url=http://localhost:9000 \
                    -Dsonar.login=$SONAR_TOKEN
                '''
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
                sh 'mvn package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                echo "[INFO] Building Docker image..."
                docker build -t $IMAGE_NAME:latest .
                '''
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm   $CONTAINER_NAME || true

                docker run -d --name $CONTAINER_NAME -p 8080:8080 $IMAGE_NAME:latest
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Déploiement terminé.'
            }
        }
    }
}
