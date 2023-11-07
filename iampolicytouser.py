import boto3, time

# T1078.004 - AWS IAM Policy Attached To User Or Role Or Group - An attachment of an AWS IAM policy to user or group or role was detected.

iam = boto3.client('iam')

# Attach policy to a user
attach = iam.attach_user_policy(UserName='poc',PolicyArn='arn:aws:iam::aws:policy/AmazonS3FullAccess')

print(attach)

time.sleep(60)

# Detach policy from a user
detach = iam.detach_user_policy(UserName='poc',PolicyArn='arn:aws:iam::aws:policy/AmazonS3FullAccess')

print(detach)