pipeline{
    agent any
    environment{
        dockerImg = ''
        registery = "myanch200/coursework2"
        registeryCredential = 'docker_id'
    }
    stages{
        
        stage('Build docker image'){
            steps{
                script{
                    dockerImg = docker.build registery
                }
            }
        }
        stage('Deploy image to dockerhub'){
            steps{
                script{
                    docker.withRegistry('', registeryCredential){
                        dockerImg.push("${env.BUILD_NUMBER}")
                        dockerImg.push("latest")
                    }
                }
            }
        }
        stage('Build test the docker image'){
            steps{
                script{
                    docker.build registery
                }
            }
        }
    }
}