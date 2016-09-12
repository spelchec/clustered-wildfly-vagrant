## Synopsis

This project builds a sample load-balanced domain-controlled Wildfly setup.

## Code Example

To start this project, run:
	vagrant init
	move Vagrantfile.txt Vagrantfile
	vagrant up
	
After a while, you should have three VMs running:
	172.28.128.88 - Wildfly domain controller with Apache and mod_cluster
	172.28.128.90 - Wildfly slave 1
	172.28.128.91 - Wildfly slave 2
	
Admin / 1234!@#$REwq


## Motivation

This was created because the JBoss/Wildfly instructions, albeit useful, weren't enough information for demoing in an environment with multiple machines.

## Installation

This project was set up on Windows 8 & 10, and uses Hashicorp Vagrant for machine provisioning.
	
Notes
* Tested against Vagrant base box centos/7 version 1607.01

## License

MIT License