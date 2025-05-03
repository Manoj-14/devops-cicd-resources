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

### Community My_sql requirement
- please follow procedures present in doc [ansible my-sql community doc](https://docs.ansible.com/ansible/latest/collections/community/mysql/mysql_db_module.html#ansible-collections-community-mysql-mysql-db-module)

### cmd's example
- `ansible web01 -m "ansible.builtin.yum" -a "name=httpd state=present" -i inventory  --become` -> to run as root (--become)
- `ansible webservers -m "ansible.builtin.service" -a "name=httpd state=started enabled=yes" -i inventory  --become` -> start and enable http
- `ansible webservers -m "ansible.builtin.copy" -a "src=index.html dest=/var/www/html/index.html" -i inventory  --become` copy index.html file from control machine
- `ansible webservers -m yum -a "name=httpd state=absent" -i inventory --become` cmd to remove packages like httpd
- playbooks will be in yaml (i.e .yaml file) , to run run playbook cmd is `ansible-playbook -i inventory web-db.yaml(playbook)` and `ansible-playbook -i inventory web-db.yaml -v` for debugging or `ansible-playbook -i inventory web-db.yaml -vv` and `ansible-playbook -i inventory web-db.yaml -vvv` and `ansible-playbook -i inventory web-db.yaml -vvvv` for more details in cmds
- `ansible-playbook -i inventory web-db.yaml --syntax-check` for syntax check
- `ansible-playbook -i inventory web-db.yaml -C` for dry-run which means it run but not the actually execution. Some times it is going to give error but run in actual execution (ex: when we write update_cache is true)
- link for module realted doc [List of modules](https://docs.ansible.com/ansible/latest/collections/index_module.html)
- Some extra dependencies (mostly pythons) needed for some modules id the requirements not satisfiled we will get the error

### ansible configuration
- Always have `ansible.cfg` file in your repository -> best practices
- Levels (priority in order)
    1. ANSIBLE_CONFIG (env var if set)
    2. ansible.cfg (in current dir) -> best for SCM and working in teams
    3. ~/.ansible.cnf (in the home dir)
    4. /etc/ansible/ansible.cfg (global)

### Variables
- where are we can define vars
    - cmd line (rarely used)
    - Playbooks
    - Inventory file (host_vars or group_vars)
    - Roles
- **Fact Variables** : setup modules ->  don't need to run setup module when ansible executed setup mudules run and fact variables are generated (ex: ansible_os_family). Until we explicitly use it , it won't used from setup module
- **Storing output**: register module -> when module exec return in jeson format from that we can store that and use it

### Template module
- Copy module just copy the file but the template module is based on **Jinja** templating like it will read the template file and paste it in target location. Like we can put ENV var in template file so that template mpdule put the env var and then it will copy the file

### Configuring NTP file (Chrony or ntp package)
- NTP -> network time protocol use to synchronize the time with multiple devices in network
- CentOs/AMAZON linux
    - config file present in `/etc/chrony.conf`
- Ubuntu
    - config file present in `/etc/ntpsec/ntp.conf`

### Handlers
- So when we have service and it is active and changed then we need to restart the service we can write a code for that but even the service get restart when it is not chaanged. So handel this type of senario we use Handlers
- To do this
    1. Put the tasks in handlers section
    2. To trigger handler we need to notify it
    3. Provide **notify** key in the task where the hander need to be notify with value as **Exact name of hander task**

### Ansible Roles
- Simplifies or seggregates all content from complrx playbooks
- Oraganization level and specifically use for reusability
- converting already ansible dir to roles are very easy
    - create roles dir `mkdir roles'
    - cd to that folder
    - then run the cmd `ansible-galaxy init post-install`
    - this will create a roles dir structure then copy all the templates, vars , files, tasks and handlers to respective dirs and main folder
    - then remove the folder and task and handler content in play-book then it will look simple
    - so add **roles** attr and add role name there
    - then in roles tasks folder main.yml file remove **/templete** dir structure in or any other structure mentioned in playbook because roles are intellegent enough to find the things and also make sure the template files are end with **.j2** suffix

### Ansible on AWS
- Create access credentials in aws and add it in control machine using
    - `export AWS_ACCESS_KEY_ID=`
    - `export AWS_SECRET_ACCESS_KEY=`
- The above method is like it will erase when we restart the system so to make it completely available make sure you mention the same in `.bashrc` file. This will execute when the system booted. At last do `source .bashrc`
