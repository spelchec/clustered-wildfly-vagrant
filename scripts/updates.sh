sudo yum -y install java
sudo yum -y install dos2unix
sudo yum -y install nmap
sudo yum -y install selinux-policy-devel

sudo chmod 777 /etc/hosts
sudo echo "172.28.128.88      controller master" >> /etc/hosts
sudo echo "172.28.128.90      slave1" >> /etc/hosts
sudo echo "172.28.128.91      slave2" >> /etc/hosts
sudo chmod 644 /etc/hosts


MC_VER=1.3.1
WF_VER=10.1.0
SQL_VER=6.0

# Copy installers
sudo cp /vagrant/installers/mod_cluster-${MC_VER}.Final-linux2-x64-ssl.tar.gz .
sudo cp /vagrant/installers/wildfly-${WF_VER}.Final.tar.gz .
sudo cp /vagrant/installers/sqljdbc_${SQL_VER}*_enu.tar.gz ./sqljdbc_${SQL_VER}.tar.gz

# Extract applications
tar -zxvf mod_cluster-${MC_VER}.Final-linux2-x64-ssl.tar.gz
sudo mv opt /
ln -s /opt/mod_cluster-${MC_VER}.Final-linux2-x64-ssl /opt/jboss

tar -zxvf wildfly-${WF_VER}.Final.tar.gz
sudo mv wildfly-${WF_VER}.Final /opt/
ln -s /opt/wildfly-${WF_VER}.Final /opt/wildfly

tar -zxvf sqljdbc_${SQL_VER}.tar.gz
sudo mv sqljdbc_${SQL_VER} /opt/
ln -s /opt/sqljdbc_${SQL_VER} /opt/sql

