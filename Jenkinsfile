pipeline {
    agent any

    environment {
        // Настройки для Maven
        MAVEN_HOME = '/usr/share/maven'
        MAVEN_OPTS = '-Xms512m -Xmx1024m'
    }

    stages {
        stage('Checkout') {
            steps {
                // Скачиваем код из GitHub
                git branch: 'master', url: 'https://github.com/dpbukin/laba_jenkins.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Сборка проекта с Maven
                    sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Docker Build and Push') {
            steps {
                script {
                    // Создаем Docker образ
                    sh 'docker build -t dbukin/serviceone:latest .'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Остановка и удаление старого контейнера
                    sh 'docker stop serviceone || true'
                    sh 'docker rm serviceone || true'
                    // Запуск нового контейнера
                    sh 'docker run -d -p 8081:8080 --name serviceone dbukin/serviceone:latest'
                }
            }
        }
    }

    post {
        always {
            // Очистка ресурсов, если что-то пошло не так
            cleanWs()
        }
    }
}
