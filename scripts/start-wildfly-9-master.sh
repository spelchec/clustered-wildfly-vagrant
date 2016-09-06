IP=$(/home/vagrant/getip.sh)
WF_VER=9.0.2
echo "Wildfly version: ${WF_VER}"
echo "IP address: $IP"
# sudo /opt/wildfly/bin/standalone.sh -c standalone-ha.xml -b $IP &


# Set up master information
sudo cp /vagrant/configuration/wildfly9/domain.xml /opt/wildfly/domain/configuration/domain.xml
sudo cp /opt/wildfly/domain/configuration/domain.xml /opt/wildfly/domain/configuration/domain.xml.orig
sudo sed -i -e "s/\\\$\\\$IP\\\$\\\$/$IP/g" /opt/wildfly/domain/configuration/domain.xml

sudo cp /vagrant/configuration/wildfly9/host.xml /opt/wildfly/domain/configuration/host.xml
sudo cp /opt/wildfly/domain/configuration/host.xml /opt/wildfly/domain/configuration/host.xml.orig
sudo sed -i -e "s/\\\$\\\$IP\\\$\\\$/$IP/g" /opt/wildfly/domain/configuration/host.xml

sudo cp /vagrant/configuration/wildfly9/host-master.xml /opt/wildfly/domain/configuration/host-master.xml
sudo cp /opt/wildfly/domain/configuration/host-master.xml /opt/wildfly/domain/configuration/host-master.xml.orig
sudo sed -i -e "s/\\\$\\\$IP\\\$\\\$/$IP/g" /opt/wildfly/domain/configuration/host-master.xml

sudo cp /opt/wildfly/domain/configuration/host-master.xml /opt/wildfly/domain/configuration/host.xml
#Set Wildfly as a service
sudo chmod 777 wildfly.conf
echo "JBOSS_OPTS=\"-b $IP -bmanagement=$IP -u 230.0.0.4 -Djboss.node.name=$IP\"" >> wildfly.conf
sudo cp wildfly.conf /etc/default/wildfly.conf
sudo cp /opt/wildfly/bin/init.d/wildfly-init-redhat.sh /etc/init.d/wildfly
sudo chkconfig --add wildfly
sudo chkconfig wildfly on
sudo mkdir /var/log/wildfly
sudo mkdir /var/run/wildfly

sudo adduser wildfly

sudo chown -R wildfly:wildfly /opt/wildfly-${WF_VER}.Final
sudo chown -R wildfly:wildfly /opt/wildfly
sudo chown -R wildfly:wildfly /var/log/wildfly
sudo chown -R wildfly:wildfly /var/run/wildfly

sudo /opt/wildfly/bin/add-user.sh --realm ManagementRealm --user MyAdminUser --password '1234!@#$REwq' --enable
sudo /opt/wildfly/bin/add-user.sh --realm ManagementRealm --user slave --password 'passw0rd!' --enable
sudo /opt/wildfly/bin/add-user.sh --realm ManagementRealm --user slave2 --password 'passw0rd!' --enable

sudo service wildfly start

# sudo systemctl start wildfly.service

# cat /opt/wildfly/standalone/log/server.log
# cat /opt/wildfly/standalone/configuration/standalone-ha.xml

# systemctl status wildfly.service

# domain log:
# /opt/wildfly/domain/log/host-controller.log

# cat /opt/wildfly/domain/configuration/host.xml | grep inet
