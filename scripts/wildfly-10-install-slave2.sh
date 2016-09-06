
yum install -y dos2unix
sudo cp /vagrant/scripts/updates.sh .
sudo chmod 777 updates.sh
dos2unix updates.sh updates.sh
./updates.sh

# wget http://downloads.jboss.org/mod_cluster//1.3.1.Final/linux-x86_64/mod_cluster-1.3.1.Final-linux2-x64-ssl.tar.gz

#sudo yum -y update
#sudo yum install -y apache2
# curl -O http://download.jboss.org/wildfly/10.1.0.CR1/wildfly-10.1.0.CR1.tar.gz

WF_VER=10.1.0

# Copy resources
# sudo cp /vagrant/installers/wildfly-${WF_VER}.Final.tar.gz .
sudo cp /vagrant/configuration/wildfly10/wildfly.conf .
sudo cp /vagrant/configuration/wildfly10/standalone-ha.xml standalone-ha.xml
sudo cp /vagrant/deployments/portal.war .

# Copy scripts
sudo cp /vagrant/scripts/getip.sh .
sudo chmod 777 getip.sh
dos2unix getip.sh getip.sh

sudo cp /vagrant/scripts/start-wildfly-10-slave2.sh start-wildfly-10-slave.sh
sudo chmod 777 start-wildfly-slave.sh
dos2unix start-wildfly-slave.sh start-wildfly-slave.sh

sudo cp /vagrant/scripts/disable-selinux.sh disable-selinux.sh
sudo chmod 777 disable-selinux.sh
dos2unix disable-selinux.sh disable-selinux.sh

# Begin processing
./disable-selinux.sh


#tar -zxvf wildfly-${WF_VER}.Final.tar.gz
#sudo mv wildfly-${WF_VER}.Final /opt/
#ln -s /opt/wildfly-${WF_VER}.Final /opt/wildfly

# WFLYTX0013  : node-identifier=”localhost” is needed.
#              Added attribute to: <core-environment node-identifier=”localhost”>
# WFLYSRV0082 : 
sudo cp standalone-ha.xml /opt/wildfly/standalone/configuration/standalone-ha.xml
sudo cp *.war /opt/wildfly/standalone/deployments/

./start-wildfly-10-slave.sh

# -b=192.168.88.55 -bmanagement=192.168.88.55 -u 230.0.0.4 -Djboss.node.name=192.168.88.55

# sudo firewall-cmd --permanent --add-port=80/tcp
# sudo firewall-cmd --permanent --add-port=443/tcp
#sudo mv -f opt /
#sudo cp httpd.conf /opt/jboss/httpd/httpd/conf/
#sudo /opt/jboss/httpd/sbin/apachectl start

#sudo cp /opt/jboss/httpd/httpd/logs/error_log /vagrant/