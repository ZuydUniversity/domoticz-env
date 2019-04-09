## Introduction
Vagrant designed to run through multiple platforms including currently Mac OS X, Microsoft Windows, Debian, Ubuntu, CentOS, RedHat and Fedora, in this document we will handle how to configure and run virtual development environment through Vagrant from scratch to up and running, on Windows environments.

## Windows Environment
To configure Vagrant inside Windows environment, we should to follow the following sections

* Installing Vagrant
* Installing Oracle VirtualBox
* Installing CMDER
* Running the Virtual Machine
* Connecting to the Virtual Machine
* Running the Virtual Machine Configuration Script Shell
* Suspending and Shutting Down Virtual Machine

## Installing Vagrant
First thing, you need to download vagrant setup from http://www.vagrantup.com/downloads.html, and then run it.

Setup wizard is straightforward, just it will ask to accept license agreement and the path to install, as you will need to use command line, please choose short path as you can, for example in our case, we will use “D:\Vagrant”, it might ask you to restart at the end of setup.

##Installing Oracle VirtualBox
You need now to download VirtualBox, use the following link to download the latest release of VirtualBox https://www.virtualbox.org/wiki/Downloads

The setup here is some longer but if you just click “Next” without any changes, it will be fine.

##Installing CMDER
By default windows platform is not equipped with ssh client, there are many ssh client applications, we will use a portable console emulator for windows called CMDER, it has many built-in functionalities in an easy way to deal with.

To download full version of CMDER, use the following link http://cmder.net/, you will find download link in the download section at the middle of the home page approximately.

After that just unzip the downloaded file and run Cmder.exe from unzipped folder.

## Clone the repository
Start CMDER and go to a folder where you want your projects to live.

```
cd <project folder>
git clone https://github.com/ZuydUniversity/domoticz-env.git
cd domoticz-env
```

Unfortunally CDMER has issue with submodules in git repositories, therefore whe have to manually clone the domoticz role.

```
cd provisioning/roles
git clone https://github.com/ZuydUniversity/ansible_role_domoticz.git domoticz
```

## Start vagrant
Start vagrant from the project folder with the command 'vagrant up'. By starting the vagrant instance a new virtual machine will be created, that will be accessible on [http://192.168.78.21:8080].
Please check the [vagrant CLI manual](https://www.vagrantup.com/docs/cli/) for more options, such ass vagrant destroy and vagrant ssh.

```
vagrant up

vagrant destroy
vagrant ssh
```
