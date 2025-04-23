## Setup remote host or instance for fabric
- create a instance in VM or in aws
- Create a user `adduser devops`
- Set password for user `passwd devops`
- Add the user to suders file `visudo` or vim the suders file in etc and add the line `devops ALL=(ALL) NOPASSWD: ALL` this will allow user to access the files with out **sudo** cmd this will hep to run root cmd from script(fabric)
- Then edit the sshd file to allow Password authentication to make that edit sshd file `vim /etc/ssh/sshd_config` find the line like **PasswordAuthentication** nad replace it with `PasswordAuthentication yes` then restart the sshd(in rhel,ssh in linux) using cmd `systemctl restart sshd` or `systemctl restart ssh`
- Then in local host gen ssh key `ssh-keygen` or `ssh-keygen -t rsa` then copy to remote using `ssh-copy-id username@hostIp` then enter password
- By doing this it won't ask password during execution of python script.
- Example python script - [fabric script](fabfile.py)