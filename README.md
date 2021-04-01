# promote-to-production-exercise

[![Guillermo Ampie](https://circleci.com/gh/guillermo-ampie/promote-to-production-exercise.svg?style=shield)](https://github.com/guillermo-ampie/promote-to-production-exercise)

A sample [Blue/Green deployment](https://en.wikipedia.org/wiki/Blue-green_deployment) using [AWS CloudFormation](https://aws.amazon.com/cloudformation/) with [CircleCI](https://www.circleci.com/)

Exercise from Udacity's [Cloud DevOps Engineer Nanodegree](https://www.udacity.com/course/cloud-dev-ops-nanodegree--nd9991)

## Description

A static website (using an [Amazon S3](https://aws.amazon.com/s3/) bucket) is updated using a Blue/Green deployment strategy using CircleCI to promote the green environment and clean-up of the blue environment automatically. 

## Usage

1.- Run: `build_first_deployment.sh`, this creates an Amazon S3 bucket and a [CloudFront](https://aws.amazon.com/cloudfront/) Distribution:

* The AWS S3 bucket is configured for static web browsing
* The CloudFront Distribution represents your "router" in the deployment
* To access the website use the CloudFront Distribution's Domain Name value:
  * The endpoint has this structure: `AUTO_GENERATED_VALUE.cloudfront.net`

2.- Update the website: for example, change the version number in the file [index.html](./index.html)

3.- The CircleCI pipeline will:

* create a new S3 bucket
* store the new website version in it
* swap the new bucket(green version) with the currently attached bucket(blue version) to the CloudFront distribution
* delete the blue environment

4.- Refresh your browser tab, you must see the "new" web site

5.- To delete all resources, run: `cleanup_resources.sh`
