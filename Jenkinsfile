pipeline {
    agent any
    environment {         
        DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"     
        }


    stages {
        stage('Build') {
            agent{         
                docker { image 'mcr.microsoft.com/dotnet/sdk:3.1' }     
        }
            steps {
                sh 'dotnet build'
                echo 'Building..'
            }
        }
        stage('Test') {
            agent{         
                docker { image 'mcr.microsoft.com/dotnet/sdk:3.1' }     
        }
            steps {
                sh 'dotnet test'
                echo 'Testing..'
            }
        }
        stage('Deploy') {
             agent{         
                docker { image 'node:14-alpine' }         
        }
            steps {
                sh 'cd DotnetTemplate.Web'
                sh 'npm install'
                sh 'npm run build'
                sh 'npm run lint'
                sh 'npm t'
                echo 'Deploying....'
            }
        }
    }
}
