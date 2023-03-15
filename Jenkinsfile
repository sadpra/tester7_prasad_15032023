pipeline{
    agent any
    stages{
        stage("TF Init"){
            steps{
                script{
               sh 'terraform init'
                echo "Executing Terraform Init"
            }
        }
            
    }
        stage("TF Validate"){
            steps{
                script{
                sh 'terraform validate'
                echo "Validating Terraform Code"
                  }
            }
     }
        stage("TF Plan"){
            steps{
                sh 'terraform plan'
                echo "Executing Terraform Plan"
            }
        }
        stage("TF Apply"){
            steps{
                sh 'terraform apply'
                echo "Executing Terraform Apply"
            }
        }
        stage("Invoke Lambda"){
            steps{
                echo "Invoking your AWS Lambda"
            }
        }
    }
}
