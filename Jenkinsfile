pipeline {
agent any

tools {
    maven 'MAVEN'   // Nom que tu as donné dans Jenkins
    jdk 'JDK17'     // Exemple si tu utilises Java 17
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

    stage('Deploy') {
        steps {
            echo 'Déploiement terminé.'
        }
    }
}


}
