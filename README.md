# bonfire.link infrastructure as code

[![](https://github.com/bonfirelink/infrastructure/workflows/linting/badge.svg?branch=master)](https://github.com/bonfirelink/infrastructure/actions?query=workflow%3Alinting+branch%3Amaster)

This repository contains Ansible playbooks to configure all bonfire.link virtual machines.

## usage

Make sure to have the following software installed in your machine before continuing:
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

To configure a VM, run a playbook from the `playbooks/` directory. For example, you can configure the web server with:

```sh
ansible-playbook playbooks/web.yaml
```

> **NOTE:** At the moment, your ssh keys need to be manually authorized server-side beforehand.

### vault

Some of the playbooks contain encrypted variables. To be able to run these playbooks, you will need to set up first the Ansible Vault password file with:

```sh
make pass-save
```

This command will save the Ansible Vault password used to decrypt the variables in plain text file. Once you are done, remember to delete it with:

```sh
make pass-clean
```

## development

For development, instead of deploying and testing your Ansible playbooks, you will preferably do so in a local virtual machine.

You will need the following software installed in your machine:
- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/) (only in macOS)

### set up a local vm

To boot up your local VM, run:

```shell
vagrant up
```

This will take some time the first time you run it, as it needs to download the Debian image that will be installed in the local VM.

Before applying any playbook on the VM, you probably want to create a snapshot.

```shell
vagrant snapshot save init
```

This will give you a quick way to restore your local VM to a freshly-installed state every time you want to deploy a different playbook.

To restore your local VM, run:

```shell
vagrant snapshot restore init
```

### deploy to the local vm

Once you have the local vm set up, you can deploy playbooks with:

```shell
ansible-playbook -i hosts/local playbooks/<playbook>
```

If something goes wrong and you want to inspect the local VM, ssh into it with:

```shell
vagrant ssh
```
