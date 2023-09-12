REGION=us-east-1

echo -n "Upload the free recipes to S3:"
aws s3 cp free_recipe.txt s3://cand-c3-free-recipes-751248255576/ --region $REGION

echo -n "Upload the paid recipes to S3:"
aws s3 cp secret_recipe.txt s3://cand-c3-secret-recipes-751248255576/ --region $REGION