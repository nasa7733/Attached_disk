pipeline {
    agent any
     
    stages {
        stage ('checkout'){
            steps {
                git branch: 'main', url: 'https://github.com/nasa7733/Attached_disk.git'
            }
        }
      

		stage('Set Terraform path') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
                }
                sh 'terraform --version'
               
               
            }
        }
        
         stage('Provision infrastructure') {
            steps {
                sh 'terraform init'
                sh 'terraform plan  -out host.plan'
                sh 'terraform apply host.plan'
                             
             
            }
        }
        
        
      
      
    }
}
