# Terraform
1. Tool from Hashicorp
2. Infrastructure as code (IaaC)
3. Terraform maintains the state of infrastructure and it knows that what is the instance state i.e maintaing the state of infrastructure

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