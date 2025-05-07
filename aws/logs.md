# Logs

- We need logs to debug the things how all going
- One option is tho sync the Logs to s3 using cmd
```bash
    aws s3 sync <log_file_location> <s3-url>
```
- When we sun cmd that logs in instance will sync to s3 bucket
- It is not a good practice because every time the developer can't login to instance and check the log to solve that we have `AWS Cloud Watch`

### Cloud Watch
- It is the motoring service given by the aws

- ex: Let stream the access_logs of httpd to cloud watch
    - We need IAM role that have access to CloudWatch and S3(optional)
    - we need to install cloud watch agent for amazon-linux version less then 2023
    ```bash
        yum install awslogs -y
    ```
    - for Amazon linux 2023
    ```bash
        yum install -y amazon-cloudwatch-agent
    ```