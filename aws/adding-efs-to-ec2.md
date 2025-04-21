# Adding EFS to EC2 (Linux or RHEL)
- Create a EC2 Instance with seperate sg (sequrity group)
- create sg for EFS, in that allow EC2 sg to access NFS
- create EFS and slect the EFS-sg that created in above step and allow for all zones.
- create access point(NFS can be mounted to EC2 using IAM or Access points) for the EFS.
- then mount to EC2 by adding cmd's to `/etc/fstab` file please follow the doc [Enabling automatic mounting on existing EC2 Linux instances](https://docs.aws.amazon.com/efs/latest/ug/mount-fs-auto-mount-update-fstab.html) 
- then run the cmd `mount -fav` cmd and you will get successfully mounted message or you will get error.
### Troubleshooting 
- check all ID's of access points and EFS
- check the sg will that allow EC2-sg or EFS-sg