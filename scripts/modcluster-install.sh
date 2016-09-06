sudo yum -y install git
sudo yum -y install maven
cd ~
curl -LO http://mirror.olnevhost.net/pub/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar xvf apache-maven-3.3.9-bin.tar.gz
sudo mv apache-maven-3.3.9 /usr/local/apache-maven

export M2_HOME=/usr/local/apache-maven
export M2=$M2_HOME/bin 
export PATH=$M2:$PATH
source ~/.bashrc
mvn -version

# https://github.com/modcluster/mod_cluster
mkdir git
cd git
git clone https://github.com/modcluster/mod_cluster.git
cd mod_cluster
mvn install
mvn -P dist package
