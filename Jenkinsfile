pipeline {
    agent any

    environment {
        DOCKER_CREDENTIAL_ID = 'Docker'
        IMAGE_NAME = 'samithhm/docker_image'
    }

    stages {

        stage('Build Java Application') {
            steps {
                sh 'javac helloworld.java'
            }
        }

        stage('Run Java Program') {
            steps {
                sh 'java helloworld'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${env.IMAGE_NAME}:latest ."
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: env.DOCKER_CREDENTIAL_ID,
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {

                    sh "docker login -u %USER% -p %PASS%"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker push ${env.IMAGE_NAME}:latest"
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}
