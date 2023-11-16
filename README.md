Certainly! Here's a sample README file for your DevOps project on hosting a static HTML web app on AWS:

---

# Static Website Deployment on AWS

## Overview

This project demonstrates the deployment of a static HTML web application on Amazon Web Services (AWS). The infrastructure is set up using a Virtual Private Cloud (VPC) with public and private subnets across two availability zones for high availability and fault tolerance.

## Infrastructure Components

1. **VPC with Subnets:**
   - Configured a VPC with public and private subnets distributed across two availability zones.

2. **Internet Gateway:**
   - Utilized an Internet Gateway to enable communication between instances in the VPC and the Internet.

3. **Security Groups:**
   - Implemented security groups to control inbound and outbound traffic, acting as a firewall for the infrastructure.

4. **Availability Zones:**
   - Utilized two availability zones to enhance high availability and fault tolerance.

5. **Resources in Public Subnets:**
   - Deployed resources such as NAT Gateway, Bastion Host, and Application Load Balancer in public subnets.

6. **EC2 Instance Connect Endpoint:**
   - Leveraged the EC2 Instance Connect Endpoint for secure and seamless connectivity to resources in public and private subnets.

7. **Private Subnets:**
   - Placed web servers and database servers in private subnets to enhance security.

8. **NAT Gateway:**
   - Enabled instances in private subnets to access the internet using a NAT Gateway.

9. **EC2 Instances:**
   - Utilized EC2 instances to host the static website.

10. **Application Load Balancer (ALB):**
    - Deployed an ALB to distribute web traffic across an Auto Scaling Group of EC2 instances in multiple availability zones.

11. **Auto Scaling Group:**
    - Implemented Auto Scaling Group to dynamically create EC2 instances, ensuring high availability, scalability, fault tolerance, and elasticity.

12. **Route 53:**
    - Registered the domain name and created a record set using Route 53.

13. **GitHub:**
    - Stored web files on GitHub for version control and easy deployment.

14. **EC2 Instance AMI Creation:**
    - After installing the website on the EC2 instance, an Amazon Machine Image (AMI) is created for future use.

## Deployment Script

```bash
#!/bin/bash
sudo su
yum update -y
yum install -y httpd
cd /var/www/html
wget https://github.com/azeezsalu/mole-sit...
unzip mole.zip
cp -r /var/www/html/mole-main/* /var/www/html
rm -rf mole.zip mole-main
systemctl enable httpd
systemctl start httpd
```

This script updates the system, installs Apache (httpd), downloads the web files from GitHub, and configures the web server.

## Usage

1. **Clone the Repository:**
   - Clone this GitHub repository to your local machine.

2. **Configure AWS CLI:**
   - Ensure that the AWS CLI is configured with the necessary access and secret keys.

3. **Run the Deployment Script:**
   - Execute the provided deployment script on your EC2 instance.

4. **Access the Website:**
   - Once the deployment is complete, access the website using the provided domain name.

For more detailed instructions, refer to the [Wiki](wiki-link) of this repository.

## Contributors

- Olalekan Famoroti

## License

This project is licensed under the [License Name] - see the [LICENSE.md](LICENSE.md) file for details.

---

Feel free to customize it based on your specific project details and requirements.


![EC2 Web Hosting Architexture](https://github.com/Olacodes-hub/X-men-website/blob/main/EC2%20Web%20Hosting%20Architexture.png)https://github.com/Olacodes-hub/X-men-website/blob/main/EC2%20Web%20Hosting%20Architexture.png)

