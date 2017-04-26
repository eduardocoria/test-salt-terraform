resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  # user data
  user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"
    
  # salt users recipe
  provisioner "file" {
    source      = "salt/users.sls"
    destination = "/tmp/users.sls"
  }
  
  # salt cron recipe
  provisioner "file" {
    source      = "salt/cron.sls"
    destination = "/tmp/cron.sls"
  }

  # Publick Key file
  provisioner "file" {
    source      = "EduardoCoria.pub"
    destination = "/home/ubuntu/key.pub"
  }

  # logger file
  provisioner "file" {
    source      = "scripts/logger.sh"
    destination = "/home/ubuntu/logger.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod 755 /home/ubuntu/logger.sh"
    ]
  }
  connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
