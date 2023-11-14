### Task 1 - EC2 Setup with Browser Automation

In this task, you will create an EC2 instance and install the necessary software to run the browser automation script.

1. Create an EC2 instance with the following configuration:
    - AMI: Amazon Linux 2
    - Instance Type: t2.micro
    - Security Group: Create a new security group and allow SSH and HTTP inbound connections from anywhere.
    - Key Pair: Create a new key pair and download it to your local machine. Remember the location where you saved the key pair file. You will need it later to SSH into the instance.
2. SSH into the instance 

* We have installed the firefox broswer both in headless and GUI instance. We have leveraged the user data to install the firefox browser in the headless instance.

### Task 2: Lambda and EC2 within VPC

In this task, I have create a EC2 instance and Lambda function within a VPC. I have attached role to both the EC2 instance and Lambda to access. 


### Task 3: Implementing Static Residential Proxies

This is something I am very new and I am not able to get it done within the time frame. 


### Task 4: Docker Orchestration on EC2

In this task,  I am able to run both headless and GUI based browsers as a containers in the EC2 instance. I have used userdata script to install the docker and run the containers.

### Task 5: Continuous Operation and Monitoring

In this task, I have used the cloudwatch to monitor the EC2 instance. I have also installed the cloudwatch agent in the EC2 instance to monitor the memory and disk usage. 

### Task 6: Cost Analysis

In this task, I have used leverages the t2.micro instance type for the EC2 instance. Which is the cheapest instance type.  I have also used the cloudwatch to monitor the EC2 instance. 
