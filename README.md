# promote-to-production-exercise

[![Guillermo Ampie](https://circleci.com/gh/guillermo-ampie/promote-to-production-exercise.svg?style=shield)](https://github.com/guillermo-ampie/promote-to-production-exercise)

A sample Blue/Green deployment exercise using AWS CloudFormation with CircleCI

Exercise from  in Udacity's [CloudDevOps Engineer Nanodegree](https://www.udacity.com/course/cloud-dev-ops-nanodegree--nd9991)

## Description

A static web site (using a S3 bucket) is updated using a Blue/Green deployment strategy using CircleCI
with automatic promotion of the green environment and clean-up of the blue environment

## Usage

1.- Run: `build-first-deployment.sh`, this creates a S3 bucket and a CloudFront distribution:

* The S3 bucker is configured for static web browsing
* The CloudFront Distribution represents your "router" in the deployment
* To access the website use the CloudFront Distribution's Domain Name value:
  * This endpoint has this structure: `AUTO_GENERATED_VALUE.cloudfront.net`

2.- Update the website: for example, change the version in file [index.html](./index.html)

3.- The CircleCI pipeline will: create a new bucket, store the new website version in it, and then swap the new bucket(green version) with the currently attached bucket(blue version) in the CloudFront distribution

4.- Refresh your browser tab, you must see the "new" web site

5.- Clean up resources!
