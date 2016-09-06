# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.box = "centos/7"

	config.vm.define "mod-cluster10" do |mc|
		mc.vm.hostname = "mod-cluster"
		mc.vm.network "private_network", ip: "172.28.128.88"
		mc.vm.provider "virtualbox" do |vb|
			vb.memory = "1024"
			vb.name = "mc-server"
		end
		mc.vm.provision :shell, path: "scripts/apache-10-install.sh"
		mc.ssh.insert_key = false
	end
	
	config.vm.define "wildfly10-slave1" do |wf|
		# mc.vm.box = "my-centos"
		wf.vm.hostname = "wildfly-slave"
		wf.vm.network "private_network", ip: "172.28.128.90"
		# use "ip addr" in centos
		# wf.vm.network "forwarded_port", guest: 8080, host: 9044, protocol: "tcp"
		wf.vm.provider "virtualbox" do |vb|
			vb.memory = "1024"
			vb.name = "wildfly-slave"
		end
		wf.vm.provision :shell, path: "scripts/wildfly-10-install-slave.sh"
		wf.ssh.insert_key = false
	end

	config.vm.define "wildfly10-slave2" do |wf|
		wf.vm.hostname = "wildfly-slave2"
		wf.vm.network "private_network", ip: "172.28.128.91"
		wf.vm.provider "virtualbox" do |vb|
			vb.memory = "1024"
			vb.name = "wildfly-slave2"
		end
		wf.vm.provision :shell, path: "scripts/wildfly-10-install-slave2.sh"
		wf.ssh.insert_key = false
	end
	
	############ Wildfly 9 below

#	config.vm.define "mod-cluster9" do |mc|
#		mc.vm.hostname = "mod-cluster"
#		mc.vm.network "private_network", ip: "172.28.128.88"
#		mc.vm.provider "virtualbox" do |vb|
#			vb.memory = "1024"
#			vb.name = "mc-server"
#		end
#		mc.vm.provision :shell, path: "scripts/apache-9-install.sh"
#		mc.ssh.insert_key = false
#	end
	
#	config.vm.define "wildfly9-slave1" do |wf|
#		wf.vm.hostname = "wildfly-slave"
#		wf.vm.network "private_network", ip: "172.28.128.90"
#		wf.vm.provider "virtualbox" do |vb|
#			vb.memory = "1024"
#			vb.name = "wildfly-slave"
#		end
#		wf.vm.provision :shell, path: "scripts/wildfly-9-install-slave.sh"
#		wf.ssh.insert_key = false
#	end

#	config.vm.define "wildfly9-slave2" do |wf|
#		wf.vm.hostname = "wildfly-slave2"
#		wf.vm.network "private_network", ip: "172.28.128.91"
#		wf.vm.provider "virtualbox" do |vb|
#			vb.memory = "1024"
#			vb.name = "wildfly-slave2"
#		end
#		wf.vm.provision :shell, path: "scripts/wildfly-9-install-slave2.sh"
#		wf.ssh.insert_key = false
#	end
	
end
