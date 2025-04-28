# Ansible
- ansible is configuration management tool came after **Puppet , Salt Stack, Chef** and befor **terraform**
- It is build on principle of simplicity
- configuration management -> its going to compare the state , if changed it apply (Indepodent)
- Use-cases
    - Any System autamation (**Automation**)
    - Production server changes (**Change mgmt**)
    - Setup Servers from scratch/Cloud provisioning (**Provisioning**)
    - Large scale automation framework (**Orchestration**)
- No agents -> target machins/Services are accessed by SSH. winrm & API
- No databases -> YAML, INI & text
- No complex setup -> just a python lib
- No Residual Software -> push python package , execute, return output
- API based calls

### YAML
- playbooks are written in YAML

### Ansible Connection
- Linux-server -> ssh
- Windows -> winrm
- cloud -> API's
- can also use network routers or some thing
- the conclusion is that ansible doesn't need any agent or servers to connct to machines thats why we dont call ansible as ansible servers

### Ansible Architecture (Not Official)
- Inventry file -> have target machin info's, how to connect to host like mentioning username, password etc
- Playbooks ->  we write playbooks like what we need to execute
- Ansible config - configuration details
- Modules -> ansible have so many modules to create databases, taking snapshots etc. it will used in above
- After all the things done it will be created to python packege and sends to target OS. If the target is not OS like it is Cloud then it will executed locally 

### Connecting target machine from control machine 
- So connect to target machine using ssh. So , write a inventory file and execute using `ansible hostname -m <module-name> -i <inveentory-file>`
- you can use regex in mentioning hostname like *, web-* etc. 
- In inventry file if you mention `*.pem` file for authentication make sute it have permission **400**
- Actully it will ask again the same question like **Are you sure do you want to connect to that machine** So to make complete automation we can disable it in ansible configuration file.
    - Initially there is default file `ansible.cfg` in folder `/etc/ansible` but to create actual file we need to create backup of that file and `cat ansible.cfg` you will get cmd to create actual config file.
    - `vim ansible.cfg` (make sure you are in folder **/etc/ansible**) then uncomment the **host_key_checking** and make it **False**

### Group
- If you have may hoste make the group and run 

### cmd's example
- `ansible web01 -m "ansible.builtin.yum" -a "name=httpd state=present" -i inventory  --become` -> to run as root (--become)
- `ansible webservers -m "ansible.builtin.service" -a "name=httpd state=started enabled=yes" -i inventory  --become` -> start and enable http
- `ansible webservers -m "ansible.builtin.copy" -a "src=index.html dest=/var/www/html/index.html" -i inventory  --become` copy index.html file from control machine