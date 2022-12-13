# Overview

Instructions for using docker compose to deploy to AWS ECS.

# Setup

First, your AWS CLI must be installed and configured. See https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html for details.  The configured user must have sufficient privileges.  A detailed list of required permissions is here: https://docs.docker.com/cloud/ecs-integration/#run-an-application-on-ecs .

__If you have multiple aws profiles configured use the `AWS_PROFILE` environment variable
to point to the correct one before proceeding.__  See https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html for information on profiles.

If you don't already have a docker context for Amazon ECS, create an ECS context:

```
docker context create ecs myecscontext
```

Note that "myecscontext" is just a name and can be anything you desire.

# Set up a VPC

By default, docker compose will deploy into the default VPC.  If this is not 
the desired result, you will need to create a VPC with at least 2 public subnets.  
The file, `vpc.yaml` is  CloudFormation template that describes a VPC with 3 public 
subnets.  You can edit this file, changing the name, availability zones, etc. as 
desired.  Once done, use the CloudFormation console to deploy the VPC and subnets.

After the VPC has been deployed, copy its identifier (looks like `vpc-0fbbc9e6c07654ca9`)
to the `x-aws-vpc` entry specify your VPC.

Note that you can keep the VPC and use it for other deployments.  `docker compose down`
will leave the VPC and subnets untouched.

# Deploy Images

In the AWS Console, go to the ECR service and create a new private repository for 
each image you wish to deploy.  To upload your locally built images, the repository 
in the AWS ECR console and click the "View push commands" button for uploading 
instructions.

Edit `compose.yaml` to refer to the images you have just pushed.

# Deploy to AWS

Docker compose creates a CloudFormation template to deploy your project.  To view the 
tempplate, you can run `docker compose convert`.

To deploy your project:

```
docker compose up
```

This can take a while.  You can follow the progress by logging onto the AWS
console and watching the output from the CloudFormation template.  Once the ECS 
cluster has been created, you can use the ECS console for further visibility.

To list the deployed services, including their publicly accessible URL:

```
docker compose ps
```

To tear everything down (except the VPC):

```
docker compose down
```









