pipeline{
    agent any
    environment{
        dockerImg = ''
        registery = "myanch200/coursework2:${currentBuildNumber}"
    }
    stages{
        
        stage('Build docker image'){
            steps{
                script{
                    dockerImg = docker.build registery
                }
            }
        }
        stage('Deploy'){
            steps{
                echo 'Hello World'
            }
        }
    }
}