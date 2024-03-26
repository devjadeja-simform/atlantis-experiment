# atlantis-experiment

1. Update `aws.credentials` in values.yaml before proceeding. This is necessary for atlantis to perform CRUD on state in S3 bucket.
2. Create a bucket for storing state in it.
3. Update the backend configuration with the S3 bucket name in `main.tf` file.