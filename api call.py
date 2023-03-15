
import boto3
lambda_client = boto3.client('https://2xfhzfbt31.execute-api.eu-west-1.amazonaws.com/candidate-email_serverless_lambda_stage/data')
lambda_payload = {
  "subnet_id": aws_subnet.subnet-1.id,
  "name": "Prasad Deshmukh",
  "email": "p2deshmukh1815@gmail.com"
}
lambda_client.invoke(FunctionName='myfunctionname', 
                     InvocationType='Event',
                     Payload=lambda_payload)