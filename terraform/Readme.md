# Terraform
1. Tool from Hashicorp
2. Infrastructure as code (IaaC)
3. Terraform maintains the state of infrastructure and it knows that what is the instance state i.e maintaing the state of infrastructure
4. To perform actions on aws make sure you cofigured access keys in you cmd line using `aws configure`

### Data types in variables
- number
- string
- boolean
- list
- map
- objects
- tuples -> list of primitivesas mentioned in type ([number,string,number] = [12,'Terraform',23])
- set -> no duplicate list
- can use from `terraformvars.tfvars`
- Var def orders (lower to higher priority):
    1. Env vars
    2. terraform.tf.vars
    3. *.auto.tfvars (alphabetical order)
    4. -var or -var-file (cmd line flags)

### Provisioners
- Provisioners in terraform are like terraform will execute it but can't manage the state (can't maintain)

### Commands
- `terraform fmt` -> format the code
- `terraform init` -> it scan all the tf file and if data block exists it will fetch it from the **terraform registry**
- `terraform validate` -> check whether syntatically correct or not
- `terraform plan` -> it gives what will be the impact of resource that we execute
- `terraform apply` -> to run the code and it will git the plan first and then it will ask us whether it is ok to sote the output in terraform state if yes only it will run.
- `terraform destory` -> destroy every resource that have created

### Output Attribute
- `output "instance_ip_addr" {` <br/> `value = aws_instance.server.public_ip` <br/> `}`
- Elements => **resourceType.resourceName.attributeName**
resourceType = aws_instance <br>
resourceName = server <br/>
attributeName = public_ip (this will present in state file)

### Backend - s3
- Don't store the state file in SCM it may have sensitive info's
- We can store it in s3 and terraform have integration for s3

## State file Management
1. Backend (remote):
    - Applly the configuration and store the state file in remote backend `S3` not on Git
2. State Locking:
    - It will help when 2 are more persons are using the state file at the same time
    - `DynomoDB` is the one which is used to store the locking information
    - this is to avoid the `race condition`
