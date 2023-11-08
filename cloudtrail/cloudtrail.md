# CloudTrail triggers

1 - Using a leaked user, list the permissions of the user, the reuslt will be that has access to some not interesting services such as appmesh(AWSAppMeshReadOnly), elasticache(AmazonElastiCacheReadOnlyAccess), iam(read-only for my own user) etc. But it has read access to buckets AmazonS3ReadOnlyAccess. 

2 - use the user to list all the buckets and look for buckets where possible sensitive information is stored, it will find some credentials about another user and the cert that can be used to access some ec2's.

- cert.pem
- credentials.txt

3 - Also look for buckets that are public so it can store info to be retrieved later.

webapp-dev-logs

4 - Using the cert, try to access the ec2's, it will find a ec2 that responds to this cert.

webapp-dev-1

5 - accessing this ec2, it will discover that it is authenticated with higher permissions to some resources like s3, cloudtrail, 