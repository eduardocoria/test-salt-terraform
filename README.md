# test-salt-terraform

This project is a proof of concept test.

It uses Terraform to install and configure salt (master and minion) in a AWS EC2 instance automatically.

#Instructions

1. Configure your AWS client credentials
2. Add your keys (Be aware you'll need to change your private and public key in vars.tf)
3. Depending your default region you might need to update vars.tf defaults AMI's
4. Run:
```bash
terraform plan
terraform apply
```
5. Once everything is running you'll get the public IP as output, then you can ssh:
```bash
ssh -i yourkey ubuntu@xxx.xxx.xxx.xxx
```

#Author

Eduardo Coria
