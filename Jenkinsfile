pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'new'//give your credential name
        IMAGE_NAME = 'samithhm/new'//give your image name
    }

    stages {

        stage('Build Java Application') {
            steps {
                sh 'javac HelloWorld.java'
            }
        }

        stage('Run Java Program') {
            steps {
                sh 'java HelloWorld'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t %IMAGE_NAME%:latest .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                credentialsId: 'new',//give your credentials mentioned above
                usernameVariable: 'USER',
                passwordVariable: 'PASS')]) {

                    sh 'echo %PASS%| docker login -u %USER% --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push %IMAGE_NAME%:latest'
            }
        }
    }
}
