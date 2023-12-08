#!/bin/bash

s3_bucket_name="felipe-v1-demo-samples"
key_name="cloudtrail-samples/passwords.zip"
file_name="${key_name##*/}"

# List s3 buckets
echo "Listing s3 buckets..."
if aws s3 ls > /dev/null 2>&1; then
  echo "S3 buckets listed successfully"
else
  echo "Error listing s3 buckets."
  exit 1
fi

# Download file from s3 bucket
echo "Downloading file from s3 bucket..."
if aws s3 cp s3://$s3_bucket_name/$key_name . > /dev/null 2>&1; then
  echo "File downloaded successfully"
  sleep 5
  echo "Deleting file..."
  rm "$file_name"
  echo "File deleted successfully"

else
  echo "Error downloading file."
  exit 1
fi