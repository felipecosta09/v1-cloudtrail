#!/bin/bash

# attach policy to a user
aws iam attach-user-policy --user-name poc --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess

sleep 60

# detach policy from a user
aws iam detach-user-policy --user-name poc --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess