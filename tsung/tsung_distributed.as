# Centos 6.4 64bit

# Make sure erlang and tsung is installed. Also prepare tsung.xml file to be placed under "/root/.tsung/" .

# There's one master node(controller), in this case we will call it's hostname T1. 
# There is also a group of slave nodes(remote), which we will call it's hostname T2/T3/T4 and so forth.



#############################
#############################
Master Node Settings
#############################
#############################

# Change host of master node. Note that the first line is NOT "127.0.0.1 localhost". Remember to add the slave nodes with ip address. 
sudo vi /etc/hosts

110.12.x.x  T1
110.12.x.x  T2
110.12.x.x  T3

# Create key so that master node can access each slave nodes without password.
cd /root/.ssh
ssh-keygen -t dsa 
chmod 600 /root/.ssh/id_dsa 

# install key in master node itself
cat id_dsa.pub >> /root/.ssh/authorized_keys 

# connecting ssh without a password
ssh-agent sh -c 'ssh-add < /dev/null && bash'



#############################
#############################
Slave Node Settings
#############################
#############################

# Change host of slave nodes directing to master. Do this for all the slave nodes.
sudo vi /etc/hosts

110.12.x.x  T1


# install key to slave node, take the key "id_dsa.pub" created from master node earlier and upload it to slave directory "/root/.ssh/"
cat id_dsa.pub >> /root/.ssh/authorized_keys 

# connecting ssh without a password
ssh-agent sh -c 'ssh-add < /dev/null && bash'


#############################
#############################
Nex Step
#############################
#############################

# Test SSH from master
ssh T1 erl
ssh T2 erl
ssh T3 erl
ssh T4 erl


# Upload tsung_stats.pl to log directory and run it to get stats report
chmod u+x tsung_stats.pl
./tsung_stats.pl


#############################
#############################
Common Gotcha
#############################
#############################

# Increase the limit on number of open files and number of processes. Use "ulimit -a" to check
sudo vi /etc/security/limits.conf 

# Add the following settings
* soft nofile 100000
* hard nofile 100000
* soft nproc 100000
* hard nproc 100000






##########################################################
##########################################################
Super Fast Way to Deploy Tsung Cluster
##########################################################
##########################################################

# Get a DigitalOcean account
# Use the $5/month deal to create a master node with the standard settings. We need to keep the master node permanently (heck it's only 5 bucks, cheaper than a happy meal)
# Create a sample slave node with hostname directed to a standard master node ip, increase the open file limit and install the ssh key
# Power off and save the sample slave node as a image so that we can reuse it next time
# Next time when you need to deploy distributed tsung, just use the slave image to fire as many nodes as you wish. Only work is that we need to update master's /etc/hosts with slave nodes ip




