#!/bin/bash

# Set the policy details
policy_name="AmazonS3FullAccess"
policy_arn="arn:aws:iam::aws:policy/$policy_name"
user_name="poc"

# Attach policy to a user
echo "Attaching policy to user..."
if aws iam attach-user-policy --user-name $user_name --policy-arn $policy_arn > /dev/null 2>&1; then
  echo "Policy $policy_name attached successfully to the user $user_name"
else
  echo "Error creating security group."
  exit 1
fi

# Detach policy from a user
echo "Detaching policy $policy_name from user $user_name..."
if aws iam detach-user-policy --user-name $user_name --policy-arn $policy_arn > /dev/null 2>&1; then
  echo "Policy $policy_name detached successfully from the user $user_name"
else
  echo "Error creating security group."
  exit 1
fi
