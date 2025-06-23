pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/snehalatabarenkal/nginx-config.git'
            }
        }
        stage('Build Nginx Configuration') {
            steps {
                echo 'Building Nginx configuration...'
                // Add any build steps if necessary
            }
        }
        stage('Deploy Nginx') {
            steps {
                script {
                    sh '''
                    sudo systemctl stop nginx
                    sudo cp -r ./nginx/* /etc/nginx/
                    sudo systemctl start nginx
                    '''
                }
            }
        }
    }
}