pipeline {
    agent{         
        docker { image 'node:14-alpine' }         
        }

    agent{         
        docker { image 'mcr.microsoft.com/dotnet/sdk:3.1' }     
        }

    stages {
        stage('Build') {
            steps {
                dotnet build
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                dotnet test
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                npm install
                npm run build
                npm run lint
                npm t
                echo 'Deploying....'
            }
        }
    }
}
