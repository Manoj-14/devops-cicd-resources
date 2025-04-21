# Auto Scaling Group (ASG)
- Create a Launch Template using your AMI (AMI of Deployed EC2)
- Create target goup (may not requried of adding any instances)
- Create ELB(ALB) using target group
- Create a ASG using launch template and load balancer (remember to choose specific scaling policy and set desire, min and max instances)

### Points to remember
- If you have updated the launch temple please choose the specific version of launch temple in ASG.
- If you updated the launch templete os ASG do the instant refresh of ASG to get the updated instances results.
- Don't login to any instances created by ASG because they are dynamically created it may leads to error.