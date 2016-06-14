Ansible
=======

Simple docker image for running [Ansible](http://docs.ansible.com/ansible/intro.html) in a container.  Most distributions ship old versions of the ansible packages.  Containerizing Ansible allows much newer versions to be used without hacking around with ppa's.

Usage
-----

The image assumes the current directory will be mounted at `/usr/src/app` inside the container, and expects at least 1 argument: 
- the ansible command to run (ansible-playbook, ansible-vault, etc)

For example, to run the playbook `site.yml` with the inventory file
`inventory.yml` in the current directory:

```shell
$ docker run \
    --rm -it \
    -v $(pwd):/usr/src/app \
    --name ansible \
    jdubz/ansible \
	ansible -h
```

An example bash function that wraps the entire command, allowing the user to simply execute `ansible` and run the entire build process in a container automatically, can be found [here](https://github.com/t3hpr1m3/dotfiles/blob/51d1e76c63d741a29edefdf1d1f9ef14351fbb3e/home/.docker_wrappers#L1).
