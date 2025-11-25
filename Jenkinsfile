pipeline {
agent any

```
stages {
    stage('Checkout') {
        steps {
            git branch: 'main', url: 'https://github.com/tonUser/tonProjet.git'
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
```

}
