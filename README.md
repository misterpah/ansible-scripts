# ansible-scripts
ansible scripts to manage stuffs. This script only work on Ubuntu


# how to run
1. Install ansible & git clone this repo.
2. ensure your ansible machine can ssh to the target machine without password. refer: https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
3. Alter hosts.ini to suit your target machine. 
4. run playbook using the command `ansible-playbook -i hosts.ini playbooks/<your_playbook.yml> -K` . note that the -K is asking password on the target machine (for sudo install and stuffs)