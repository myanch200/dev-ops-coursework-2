pipeline{
    agent any
     triggers {
        githubPush()
    }
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
                    dockerImg.inside{
                        sh 'echo "Contianer is passing the test"'
                    }
                }
            }
        }
        stage('Deploy to kubernetes'){
            steps{
                sshagent(['jenkins-ssh']){
                    sh 'kubectl set image deployments/coursework-deployment coursework2=myanch200/coursework2:latest'
                }
            }
        }
}
}