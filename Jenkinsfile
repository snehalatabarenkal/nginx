pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nginx-custom:latest"
        DOCKER_CONTAINER = "nginx-dev"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/snehalatabarenkal/nginx.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Stop Old Container (if running)') {
            steps {
                script {
                    sh '''
                        if [ $(docker ps -q -f name=$DOCKER_CONTAINER) ]; then
                            docker stop $DOCKER_CONTAINER
                            docker rm $DOCKER_CONTAINER
                        fi
                    '''
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh '''
                        docker run -d --name $DOCKER_CONTAINER -p 80:80 $DOCKER_IMAGE
                    '''
                }
            }
        }
    }

    post {
        success {
            echo '✅ Deployment completed successfully!'
        }
        failure {
            echo '❌ Deployment failed.'
        }
    }
}

                
