pipeline {
agent any

stages {
    stage('Checkout') {
        steps {
            git branch: 'master', url: 'https://github.com/hamouda0esprit/DEVOPS.git/'
        }
    }

    stage('Build') {
        steps {
            echo 'Compilation en cours...'
        }
    }

    stage('Tests') {
        steps {
            echo 'Exécution des tests...'
        }
    }

    stage('Deploy') {
        steps {
            echo 'Déploiement terminé.'
        }
    }
}


}
