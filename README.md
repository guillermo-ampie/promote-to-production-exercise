# promote-to-production-exercise
A sample Blue/Green deployment exercise using AWS CloudFormation

Exercise from  in Udacity's [CloudDevOps Engineer Nanodegree](https://www.udacity.com/course/cloud-dev-ops-nanodegree--nd9991)

## Description
A static web site (using a S3 bucket) is updated using a Blue/Green deployment strategy using CircleCI

with automatic promotion of green environment and clean-up of blue environment

## Usage
1.- Execute build-first-deployment.sh

2.- Update the code: for example, change the version in file index.html

3.- Connecto to the CloudFormation endpoint
