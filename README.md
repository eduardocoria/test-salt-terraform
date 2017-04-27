# test-salt-terraform

This project is a proof of concept test.

It uses Terraform to install and configure salt (master and minion) in the same AWS EC2 instance automatically.

Two salt states are created:

1. cron.sls: It creates a cron entry to run a script which counts all log lines every 30 minutes and stores the results.
2. users.sls: It creates 3 new users: testuser0, testuser1, and testuser2.
 
## Instructions

1. Configure your AWS client credentials
2. Add your keys (Be aware you will need to change your private and public key names in vars.tf)
3. Depending on your default region you might need to update vars.tf with the apropiete defaults AMI's
4. Run:
```bash
terraform plan
terraform apply
```
5. Once everything is running you will get the public IP as output, then you can ssh:
```bash
ssh -i yourkey ubuntu@xxx.xxx.xxx.xxx
```

## Author

Eduardo Coria
