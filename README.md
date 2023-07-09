# Hosting a Website on AWS EC2 Instance - README

This README file provides instructions for hosting a website on an AWS EC2 instance using the following resources:

- 1 VPC (Virtual Private Cloud)
- 2 Public Subnets and 2 Private Subnets in 2 Availability Zones
- 2 NAT Gateways
- 1 Internet Gateway
- 1 Public Route Table
- 2 Private Route Tables
- Routing Configuration
- SSH Security Group
- Application Load Balancer Security Group
- Web Server Security Group
- 1 Application Load Balancer (ALB) with Target Group
- Auto Scaling Group (ASG) with a minimum of 2 Web Servers (with HTTPS)

## Prerequisites

Before proceeding with the website hosting setup, ensure you have the following:

- An AWS account with appropriate permissions to create and manage resources.
- A domain name registered and managed through Route 53 (optional but recommended).
- An SSL/TLS certificate for securing HTTPS traffic (required for ALB).

## Step 1: Create a VPC

1. Log in to your AWS Management Console.
2. Navigate to the VPC service.
3. Click on "Create VPC" to start the VPC creation wizard.
4. Provide a name and specify the desired IP address range for your VPC.
5. Configure other VPC settings as required.
6. Review and create the VPC.

## Step 2: Create Subnets and Availability Zones

1. Within the VPC service, navigate to "Subnets."
2. Create 2 Public Subnets in different Availability Zones (AZs).
3. Create 2 Private Subnets in different AZs.
4. Ensure that the Public Subnets have auto-assign public IP enabled.
5. Associate the appropriate Route Tables with the subnets.

## Step 3: Create NAT Gateways

1. In the VPC service, navigate to "NAT Gateways."
2. Create 2 NAT Gateways, one in each Public Subnet.
3. Associate the respective Elastic IP addresses with the NAT Gateways.
4. Update the route tables of the Private Subnets to route internet-bound traffic through the NAT Gateways.

## Step 4: Set up Internet Gateway and Routing

1. In the VPC service, navigate to "Internet Gateways."
2. Create an Internet Gateway and attach it to the VPC.
3. Update the Public Route Table to include a route for "0.0.0.0/0" pointing to the Internet Gateway.
4. Verify that the Private Route Tables have routes for the NAT Gateways.

## Step 5: Configure Security Groups

1. Access the EC2 service in the AWS Management Console.
2. Create a Security Group for SSH access to the EC2 instances.
3. Create a Security Group for the Application Load Balancer (ALB) to allow incoming traffic on port 80 (HTTP) and port 443 (HTTPS).
4. Create a Security Group for the Web Servers to allow incoming traffic on port 80 (HTTP) and port 443 (HTTPS).
5. Configure the Security Group rules based on your specific requirements.

## Step 6: Create an Application Load Balancer (ALB)

1. In the EC2 service, navigate to "Load Balancers."
2. Create an Application Load Balancer (ALB) with the desired configuration.
3. Configure the ALB to use the created Security Group and select the appropriate subnets.
4. Create a Target Group and associate it with the ALB.

## Step 7: Set up Auto Scaling Group (ASG)

1. In the EC2 service, navigate to "Auto Scaling Groups."
2. Create an Auto Scaling Group (ASG) with the desired configuration.
3. Specify the minimum and desired number of instances as 2 (or more as needed).
4. Select the created Launch Template or Configuration for the ASG.
5. Configure the ASG to use the ALB Target Group.
6. Enable health checks for the instances.
7. Set up scaling policies and notifications as per your requirements.

## Step 8: Configure DNS (Optional)

1. If using a domain name registered through Route 53:
   - Navigate to the Route 53 service in the AWS Management Console.
   - Create a new "A" record or edit an existing one to point to the ALB's DNS name.
   - Wait for DNS propagation to complete, which may take some time.

2. If using a domain name registered with a different provider:
   - Access your domain registrar's control panel or DNS management interface.
   - Create a DNS record (usually an "A" record) pointing to the ALB's DNS name.
   - Follow the instructions provided by your domain registrar for making DNS changes.

## Step 9: Upload Website Files

1. Connect to the EC2 instances using SSH or the remote desktop protocol (RDP).
2. Copy your website files to the appropriate directory on the instances.
3. Verify that the website files are accessible and placed correctly.

## Step 10: Test and Verify

1. Open a web browser and enter your domain name.
2. Verify that the website loads correctly and all functionalities are working as expected.

Congratulations! Your website is now hosted on the AWS EC2 instances using an Application Load Balancer with HTTPS support and Auto Scaling.

Remember to monitor your resources, regularly apply security updates, and take necessary backups to ensure the availability and security of your hosted website.

For more detailed instructions and advanced configurations, please refer to the official AWS documentation.

Happy hosting!

![EC2 Web Hosting Architexture](image_url)

