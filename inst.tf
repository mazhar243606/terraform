variable "aws_access_key" {
    default = "AKIAJBBMWRP4WPCSZN7A"
}
variable "aws_secret_key" {
    default = "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"
}
variable "key_name" {
  default = "test"
} 



variable "region" {
  default = "us-east-1"
}   

resource "aws_instance" "nginx" {
ami = "ami-c58c1dd3"
instance_type = "t2.micro"
key_name = "${var.key_name}"
connection {
user = "ec2-user"
# private_key = "${file(var.private_key_path)}"
}

provisioner "remote-exec" {
inline = [
"sudo yum install nginx -y",
"sudo service nginx start"
    ]
  }
}
output "aws_instance_public_dns" {
    value = "${aws_instance.nginx.public_dns}"
}
