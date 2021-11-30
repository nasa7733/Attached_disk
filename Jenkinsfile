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
                sh """
		terraform init
                terraform plan -out host.plan
                terraform apply host.plan
		"""
		}
	}
	stage ('post Build') {
	steps {
	//sh 'gcloud config set project midevops'
	sh 'gcloud compute instances add-metadata test01  --metadata startup-script-url=gs://midevops/scripts.sh'
	
		}
	
	}
	stage (cleanup) {
	steps {
		sh """
		sleep 600
		terraform destroy -auto-approve
		"""
		   
            }
        }
    }
}
