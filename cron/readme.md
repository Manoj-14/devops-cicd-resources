# CRON Jobs
- it supports min for 1 min for sec need to write while loop in sh and need to run it
- Syntex for the jobs `min hr day-of-month month day-of-week`
- ex:
    - `30 5 1 1 1` -> every jan 1st sunday 5:30
    - "*/5 * * * *" -> every 5 min

Setting Up in ubuntu
- script.sh
    ```bash
        ping 44.203.141.55 -c 2
    ```
    add +x after creating it
- add this in cron job file to get thet run `crontab -e` it will give or create a cron file in that you can add
```bash
    */1 * * * * /home/ubuntu/script.sh 1>/home/ubuntu/cronJob.log #it will log output in cronJob.log
    */1 * * * * /home/ubuntu/script.sh >>/home/ubuntu/cronJob.log 2>&1 #it will log error and output
```

### Setting up mail for cron job

- Installation
    ```bash
        sudo apt update
        sudo apt install msmtp msmtp-mta mailutils
    ```
- Enable Gmail App Password (for gmails)
    - create app passsword here https://myaccount.google.com/apppasswords
    - copy the 16digit password

- Configure msmtp
    ```bash
        nano ~/.msmtprc
    ```
    - paste below there
        ```
            defaults
            auth           on
            tls            on
            tls_trust_file /etc/ssl/certs/ca-certificates.crt
            logfile        ~/.msmtp.log

            account        gmail
            host           smtp.gmail.com
            port           587
            from           your@gmail.com
            user           your@gmail.com
            password       your_app_password

            account default : gmail
        ```
        - secure the file `chmod 600 ~/.msmtprc`
        - Add MAILTO to crontab `MAILTO="your@gmail.com"` bwlow you can add jobs
