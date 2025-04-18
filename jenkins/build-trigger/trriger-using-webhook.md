# Trigger using webhook
- Copy the jenkins url (only till port number)
- go to gihub reo settings
- Goto webhoook -> add webhook
- paste the url there (ex: http://3.80.89.159:8080/github-webhook/) no spelling mistage or spaces
- content is application/json
- select the event which you want (ex: push)
### Troubleshooting
- check the url and content type
- make sure you have anywhere in place of MY IP in instance security groups
