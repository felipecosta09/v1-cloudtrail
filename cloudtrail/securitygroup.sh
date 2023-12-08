#!/bin/bash

# Set the security group details
SG_BASE_NAME="my-security-group"
SG_DESCRIPTION="My security group description"

# Generate a unique identifier (timestamp)
UNIQUE_ID=$(date +%s)

# Append the unique identifier to the base name
SG_NAME="$SG_BASE_NAME-$UNIQUE_ID"

# Step 1: Create the security group
echo "Creating security group..."
if aws ec2 create-security-group \
  --group-name "$SG_NAME" \
  --description "$SG_DESCRIPTION" > /dev/null 2>&1; then
  echo "Security group created successfully: $SG_NAME"
else
  echo "Error creating security group."
  exit 1
fi

# Step 2: Delete the security group
echo "Deleting security group..."
if aws ec2 delete-security-group \
  --group-name "$SG_NAME" > /dev/null 2>&1; then
  echo "Security group deleted successfully: $SG_NAME"
else
  echo "Error deleting security group."
  exit 1
fi