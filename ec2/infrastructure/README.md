# Playbook to create a single instance in EC-2

### Overview
Playbook will:
  * Create a public VPC if it does not exist
  * Create a security group if it does not exist
  * Create an instance with a specific Name if does not exist
  * Associate an elastic ip to the instance
  * Configure a hostname with the elastic ip through Route53
  * Wait for SSH to be up on the instance

### Pre-Reqs
  * Set the AWS environment variables
     * AWS_ACCESS_KEY_ID
     * AWS_SECRET_ACCESS_KEY
  * Configure a SSH Key in your AWS EC-2 account for the given region
  * Create a hosted zone in Route53

### Execute
  * Edit the variables file
     * ssh_key_name     - ssh key name to use, must already be imported in ec2 region
     * target_dns_zone  - hosted zone in Route53 you want to use
  * `./run.sh`
    * Calls:  `ansible-playbook create_aws_infrastructure.yml`

### Tested with
  * ansible 2.2.2.0
    * Problems were seen using ansible 2.0
