# Creating ELB with EC@s
1. Create EC2 instance
2. Create AMI of created instance 
3. create a launch templete of thet AMI
4. Create target group (need 2 or more instance to redirect request)
5. then create the ALB for http or https
6. In security group of ec2 make sute it allows the security groups or ALB to access port 80 or other