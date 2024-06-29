#!/bin/bash


###############
#Author : yagyagoel1
# Date : 28-06-24
# 
#Version: v1
#
# This script will report the AWS resource usage
###############

# AWS S3
# AWS EC2
# AWS LAMDA
# AWS IAM Users

set -x #debug mode
set -e #exit on error 
set -o pipefail


# list s3 bucket 
echo "print list of s3 bucket "
aws s3 ls >>Resources.log

#list All the ec2 instances
echo "print list of ec2"

aws ec2 describe-instances >>Resources.log


#list lambda
echo "print list of lamda function "

aws lambda list-functions | jq '.Reservations[].Instances[].InstanceId' >> Resources.log

#list IAM users
echo "print list of iam user "

aws iam list-users >> Resources.log
