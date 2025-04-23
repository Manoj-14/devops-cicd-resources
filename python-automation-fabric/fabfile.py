from fabric.api import *

def greetings(msg):
	print("Good {}".format(msg))

def system_info():
	print("Disk Space.")
	local("df -h") # running in local machines


def remote_exec():
	run("hostname") #running in remote machines
	run("uptime")
	run("df -h")
	run("free -m") 

	sudo("yum install unzip zip wget -y") # for sudo cmds

def web_setup(WEBURL,DIRNAME):
	print("###############################################")
	print("Installing dependencies")
	print("###############################################")
	sudo("yum install httpd unzip wget -y")

	print("###############################################")
	print("Start and enable services")
	print("###############################################")
	sudo("systemctl start httpd")
	sudo("systemctl enable httpd")

	print("###############################################")
	print("Install zip, unzip, wget locally")
	print("###############################################")
	local("brew install zip unzip wget")

	print("###############################################")
	print("Downloading and pushing the website to webservers")
	print("###############################################")
	local(("wget -O website.zip %s") % WEBURL)  # -O means save the downloaded file in provided name
	local("unzip -o website.zip") # -o means overide if any same file found while unzipping

	with lcd(DIRNAME): # lcd -> local cd
		local("zip -r tooplate.zip *")
		put("tooplate.zip","/var/www/html/", use_sudo=True)
	
	with cd("/var/www/html/"): # cd -> exec in remote
		sudo("unzip -o tooplate.zip")
	
	sudo("systemctl restart httpd")

	print("Website setup done!!")
