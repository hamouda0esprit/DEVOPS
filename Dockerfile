# Étape 1 : utiliser une image Java pour compiler et exécuter
FROM eclipse-temurin:22-jdk-jammy

# Répertoire de l'application dans le conteneur
WORKDIR /app

# Copier le jar construit par Maven
COPY target/student-management-0.0.1-SNAPSHOT.jar app.jar

# Exposer le port Spring Boot par défaut
EXPOSE 8080

# Commande pour lancer l'application
ENTRYPOINT ["java","-jar","app.jar"]
