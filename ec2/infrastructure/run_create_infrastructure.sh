#!/bin/sh
[ -z "$AWS_ACCESS_KEY_ID" ] && echo "Missing environment variable:  AWS_ACCESS_KEY_ID" && exit 1;
[ -z "$AWS_SECRET_ACCESS_KEY" ] && echo "Missing environment variable:  AWS_SECERT_ACCESS_KEY" && exit 1;
[ -z "$AWS_SSH_PRIV_KEY_PATH" ] && echo "Missing environment variable:  AWS_SSH_PRIV_KEY_PATH\nPlease set this to the path for your SSH private key\n" && exit 1;

source ./common_vars
ansible-playbook -u ${EC2_USER} --private-key ${AWS_SSH_PRIV_KEY_PATH} infrastructure.yml --extra-vars "${EXTRA_VARS}"
