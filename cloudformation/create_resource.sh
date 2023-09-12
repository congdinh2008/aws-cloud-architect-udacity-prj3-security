REGION="us-east-1"

# echo -n "Deploy the S3 buckets:"
# aws cloudformation create-stack \
#     --region $REGION \
#     --stack-name c3-s3 \
#     --template-body file://c3-s3.yml
# sleep 100

# echo -n "Deploy the VPC and Subnets:"
# aws cloudformation create-stack \
#     --region $REGION \
#     --stack-name c3-vpc \
#     --template-body file://c3-vpc.yml
# sleep 100

echo -n "Create a key pair form app:"
aws ec2 create-key-pair \
    --region $REGION \
    --key-name c3-app \
    --query 'KeyMaterial' \
    --output text > c3-app.pem

sleep 20
echo -n "Deploy the Application Stack:"
aws cloudformation create-stack \
    --region $REGION \
    --stack-name c3-app \
    --template-body file://c3-app.yml \
    --parameters ParameterKey=KeyPair,ParameterValue=c3-app \
    --capabilities CAPABILITY_IAM