# Load the base updates (yum, jboss, wildfly)

yum install -y dos2unix
sudo cp /vagrant/scripts/updates.sh .
sudo chmod 777 updates.sh
dos2unix updates.sh updates.sh
./updates.sh

# wget http://downloads.jboss.org/mod_cluster//1.3.1.Final/linux-x86_64/mod_cluster-1.3.1.Final-linux2-x64-ssl.tar.gz

#sudo yum -y update
#sudo yum install -y apache2
# curl -O http://downloads.jboss.org/mod_cluster//1.3.1.Final/linux-x86_64/mod_cluster-1.3.1.Final-linux2-x64-ssl.tar.gz

#sudo yum -y install dos2unix
#sudo yum -y install nmap
#sudo yum -y install selinux-policy-devel

# sudo cp /vagrant/mod_cluster.te mod_cluster.te

sudo cp /vagrant/scripts/getip.sh .
sudo chmod 777 getip.sh
dos2unix getip.sh getip.sh

sudo cp /vagrant/scripts/wildfly-9-install-master.sh wildfly-9-install-master.sh
sudo chmod 777 wildfly-9-install-master.sh
dos2unix wildfly-9-install-master.sh wildfly-9-install-master.sh

# Have to be root
#sudo cp /vagrant/installers/mod_cluster-1.3.1.Final-linux2-x64-ssl.tar.gz .
sudo cp /vagrant/configuration/httpd/httpd.conf .

#tar -zxvf mod_cluster-1.3.1.Final-linux2-x64-ssl.tar.gz
# sudo firewall-cmd --permanent --add-port=80/tcp
# sudo firewall-cmd --permanent --add-port=443/tcp
#sudo mv -f opt /

IP=$(/home/vagrant/getip.sh)
sudo cp httpd.conf /opt/jboss/httpd/httpd/conf/httpd.conf.orig
sudo cp /opt/jboss/httpd/httpd/conf/httpd.conf.orig /opt/jboss/httpd/httpd/conf/httpd.conf
sudo sed -i -e "s/\\\$\\\$IP\\\$\\\$/$IP/g" /opt/jboss/httpd/httpd/conf/httpd.conf

# Uncertain if needed yet.
# sudo make -f /usr/share/selinux/devel/Makefile
# semodule -i mod_cluster.pp

sudo /opt/jboss/httpd/sbin/apachectl start

# The mod_cluster machine should also have wildfly installed? This way it identifies its neighbors.
./wildfly-9-install-master.sh

# sudo /opt/jboss/httpd/sbin/apachectl status
# sudo vi /opt/jboss/httpd/httpd/conf/httpd.conf
# vi 

# sudo nmap -sV 172.28.128.*