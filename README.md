## Synopsis

This project builds a sample load-balanced domain-controlled Wildfly setup.

## Code Example

To start this project in Windows, run from the installed location:

```
erase Vagrantfile
vagrant init
copy Vagrantfile.txt Vagrantfile
move Vagrantfile.txt Vagrantfile
vagrant up
```
	
After a while, you should have three VMs running:
* `172.28.128.88` - `mod-cluster10` -- Wildfly domain controller with Apache and mod_cluster
* `172.28.128.90` - `wildfly10-slave1` -- Wildfly slave 1
* `172.28.128.91` - `wildfly10-slave2` -- Wildfly slave 2

```
Username		|		Password
----------------+---------------------
MyAdminUser		/		1234!@#$REwq
slave, slave2	/		passw0rd!
```

## Motivation

This was created because the JBoss/Wildfly instructions, albeit useful, weren't enough information for demoing in an environment with multiple machines.

## Installation

This project was set up on Windows 8 & 10, and uses Hashicorp Vagrant for machine provisioning.

* [Hashicorp Vagrant](https://www.vagrantup.com/)
 * [with CentOS 7 box v1608.02](https://atlas.hashicorp.com/centos/boxes/7/)

Installers

* [Wildfly 10.1.0](http://wildfly.org/downloads/) wildfly-10.1.0.Final.tar.gz
* [mod_cluster bundle with Apache](http://mod-cluster.jboss.org/downloads) mod_cluster-1.3.1.Final-linux2-x64-ssl.tar.gz
	
## License

MIT License