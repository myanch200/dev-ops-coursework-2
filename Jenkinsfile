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
                sshagent(credentials: ['jenkins-ssh']) {
                    sh 'echo pwd'
                    sh 'ssh -t -t ubuntu@3.20.225.53 -o StrictHostKeyChecking=no echo "kubectl rollout restart deployment/demo && kubectl get deployment"'
                   
    // some block
            }           
            }
        }
}
}