# terraform {
#   backend "s3" {
#     bucket         = ""         # The name of your S3 bucket
#     key            = "" # The path within the bucket for the state file
#     region         = ""                      # Your desired AWS region
#     encrypt        = true                                  # Enable encryption for security
#     dynamodb_table = ""                 # Optional: Use DynamoDB for state locking
#   }
# }