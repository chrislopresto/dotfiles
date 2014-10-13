# chrislopresto dotfiles

These are my dotfiles. This repository is a homesick castle and adheres to the conventions specified at [technicalpickles/homesick](https://github.com/technicalpickles/homesick)

## Initial Setup

```
gem install homesick --no-document
homesick clone chrislopresto/dotfiles
homesick symlink dotfiles --force
```

## Environment Provisioning

I use [thoughtbot/laptop](https://github.com/thoughtbot/laptop) to provision environments in a repeatable, idempotent fashion. The laptop script allows a user to specify additional install commands in a dotfile, which I obviously maintain in this repository [here](https://github.com/chrislopresto/dotfiles/blob/master/home/.laptop.local). I include the **Initial Setup** commands specified above (among others) in this file.

This leads to a bootstrapping problem, since the laptop script needs the `.laptop.local`file before it has a chance to clone the `chrislopresto/dotfiles` repository. So I `curl` the `.laptop.local` dotfile prior to running the laptop script.

```
cd ~ ; curl https://raw.githubusercontent.com/chrislopresto/dotfiles/master/home/.laptop.local -o .laptop.local ; cd -
bash <(wget -qO- https://raw.githubusercontent.com/thoughtbot/laptop/master/linux) 2>&1 | tee ~/laptop.log
```

A few notes:

- The latest version of the laptop command will always be specified here: [thoughtbot/laptop](https://github.com/thoughtbot/laptop)
- Note that pairing the `homesick clone`/`pull` commands and the `homesick unlink`/`symlink` commands allows the script to be run repeatedly. Homesick spits out warnings that can be safely ignored.

## Provisioning a Laptop'ed Vagrant Box

Thoughtbot publishes [Vagrant boxes](https://github.com/thoughtbot/laptop#laptoped-linux-vagrant-boxes) with the Laptop script applied. Here are instructions for running the above setup atop the Ubuntu 14.04 distro.

```
vagrant init thoughtbot/ubuntu-14-04-server-with-laptop ; vagrant up
vagrant ssh
cd ~ ; curl https://raw.githubusercontent.com/chrislopresto/dotfiles/master/home/.laptop.local -o .laptop.local ; cd -
bash <(wget -qO- https://raw.githubusercontent.com/thoughtbot/laptop/master/linux) 2>&1 | tee ~/laptop.log
. ~/.zshrc
```

Note that everything after `vagrant ssh` is executed in the VM.
