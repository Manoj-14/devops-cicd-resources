# Python automation using fabric

- Make sure you have python and pip
- Install fabric `pip install fabric` you can also specify the version
- Create a folder and create a file called `fabfile.py` (default name to run fabric)
- cmds to run fabric file:
    - `fab -l` give the functions present in this file
    - `fab functionName:para1,para2` -> to run function
    - `fab -H hostname -u username unctionName:para1,para2` to run in remote host