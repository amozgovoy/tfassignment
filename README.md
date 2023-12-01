## A TF Assignment

To create the infrastructure requested first the credentials needs to be configured using the `aws configure` command. 
The code is tested with terraform v1.6.5

First, you need to clone the repository and then run `terraform init` to install the required providers.
Next, please edit the `variables.tf` file, specifically the `public_key` variable, and paste your SSH public key
there to be able to login. Please use the `ec2-user` as a username, i.e. the command to connect will be
`ssh ec2-user@<instance_public_ip>`.
If you plan to login to other box to test the connectivity, you can use the following command 
`ssh -o ForwardAgent=yes ec2-user@<instance_public_ip>`, assuming you have the SSH agent configured on your machine.
From the AWS EC2 instance, the connectivity should be tested using private IP addresses, i.e. to connect from Server1
to Server2 via ssh, use the following command: `ssh <target_instance_private_ip>`

Once the test is completed, use `terraform destroy` to clean up the resources created.

### Ways to improve the code
- Use Data Source to utilize existing VPCs, subnets and internet gateways
- The certified AMI images should be used, I used the community image because my temp AWS account role
doesn't allow me to create a free subscription for AWS provided CentOS image 

### My feedback
- I think the test is ok considering the time/complexity involved.