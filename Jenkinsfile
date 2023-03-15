pipeline{
    agent any
    stages{
        stage("TF Init"){
            steps{
                sh 'terraform init'
                echo "Executing Terraform Init"
            }
        }
        stage("TF Validate"){
            steps{
      
                sh 'terraform validate'
                echo "Validating Terraform Code"
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
