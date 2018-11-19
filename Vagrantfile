# -*- mode: ruby -*-
# vi: set ft=ruby :
# 
# You can set these variables in ~/.vagrant.d/Vagrantfile, if you wish to change the defaults.
$vm_memory ||= "1024"
$vm_cpus   ||= 1

# These values may be overwritten in a Vagrantfile.local.
$use_nfs = false
$use_actimeo = false

# Include Vagrantfile.local if it exists to overwrite the variables.
if File.exists?("Vagrantfile.local")
    eval File.read("Vagrantfile.local")
end

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.provision "shell", path: "deploy-playbook.sh"

    N = 1
    (1..N).each do |machine_id|
        config.vm.define "domoticz#{machine_id}" do |machine|
            machine.vm.hostname = "domoticz#{machine_id}"
            machine.vm.network "private_network", ip: "192.168.78.#{20+machine_id}"
            machine.vm.provider :virtualbox do |virtualbox|
                virtualbox.name = "domoticz#{machine_id} - 192.168.78.#{20+machine_id} - 18.04"
                virtualbox.customize [
                    "modifyvm", :id,
                    "--natdnshostresolver1", "on",
                    "--natdnsproxy1", "on",
                    "--memory", $vm_memory,
                ]
                if !$vm_cpus.nil?
                    virtualbox.customize [
                        "modifyvm", :id,
                        "--cpus", $vm_cpus,
                    ]
                end
            end
        end
    end
end