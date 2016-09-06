echo 0 >/selinux/enforce
sudo setenforce Permissive
sudo sed -i -e 's/SELINUX=[abcdefgilornpmsv]*/SELINUX\=disabled/' /etc/sysconfig/selinux
sudo sed -i -e 's/SELINUX=[abcdefgilornpmsv]*/SELINUX\=disabled/' /etc/selinux/config
sestatus
cat /etc/sysconfig/selinux
