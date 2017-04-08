# Playbook to create a single instance in EC-2

### Overview
Playbook will:
  * Create a public VPC if it does not exist
  * Create a security group if it does not exist
  * Create an instance with a specific Name if does not exist
  * Associate an elastic ip to the instance
  * Configure a hostname with the elastic ip through Route53
  * Wait for SSH to be up on the instance
  * Install Apache onto the instance as an example of working with a tagged instance from a dynamic inventory

### Pre-Reqs
  * Ansible needs to be installed so it's source code is available to Python.
    * Check to see if Ansible modules are available to Python
            $ python -c "import ansible;print(ansible.__version__)"
            2.2.2.0
    * MacOS requires Ansible to be installed from `pip` and not `brew`
          $ python -c "import ansible;print(ansible.__version__)"
          Traceback (most recent call last):
          File "<string>", line 1, in <module>
          ImportError: No module named ansible

          brew uninstall ansible
          pip install ansible

          $ python -c "import ansible;print(ansible.__version__)"
          2.2.2.0
  * Install python dependencies
     * `pip install boto boto3 six`
  * Configure a SSH Key in your AWS EC-2 account for the given region
  * Create a hosted zone in Route53
  * Set these environment variables:
    * AWS_ACCESS_KEY_ID
    * AWS_SECRET_ACCESS_KEY
    * AWS_SSH_PRIV_KEY_PATH  - Path to your private ssh key to use for the ec2 instances

### Execute
  * Edit the variables file `common_vars`
    * Update:
              export AWS_SSH_KEY_NAME="splice"
              export TARGET_DNS_ZONE="ec2.dog8code.com"
        * TARGET_DNS_ZONE needs to match a hosted zone entry in your Route53 account, we will create a subdomain under it for the ec2 instance
  * `./run_create_infrastructure.sh`
    * Creates our infrastructure in ec2 if it doesn't exist
  * `./run_install_and_configure.sh`
    * Uses a dynamic EC-2 Inventory and executes a task as a test on what we previously created based on a tag

### Tested with
  * ansible 2.2.2.0
    * Problems were seen using ansible 2.0
