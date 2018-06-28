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
    file_mode = "w"

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
            if machine_id == N
                machine.vm.provision :ansible do |ansible|
                    ansible.extra_vars = {
                        ansible_python_interpreter: "/usr/bin/python3",
                    }
                    if File.exists?("provisioning/requirements.yml")
                        ansible.galaxy_role_file = "provisioning/requirements.yml"
                    end
                    ansible.limit = "all"
                    ansible.playbook = "provisioning/deploy.yml"
                    ansible.inventory_path = "hosts.vagrant"
                end
            end
        end
        File.open("hosts.vagrant" , file_mode) do |f|
                f.write "domoticz#{machine_id} "
                f.write "ansible_host=192.168.78.#{20+machine_id} "
                f.write "anisble_become=true "
                f.write "ansible_become_method=sudo\n"
        end
        file_mode = "a"
    end
end