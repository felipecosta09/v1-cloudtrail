#!/bin/bash

# Set the policy details
policy_name="AmazonS3FullAccess"
policy_arn="arn:aws:iam::aws:policy/$policy_name"
user_name="poc"

# Create a User
echo "Creating user..."
if aws iam create-user --user-name $user_name > /dev/null 2>&1; then
  echo "User $user_name created successfully"
else
  echo "Error creating user."
  exit 1
fi

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

# Delete a user
echo "Deleting user $user_name..."
if aws iam delete-user --user-name $user_name > /dev/null 2>&1; then
  echo "User $user_name deleted successfully"
else
  echo "Error deleting user."
  exit 1
fi