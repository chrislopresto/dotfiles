# chrislopresto dotfiles

These are my dotfiles. This repository is a homesick castle and adheres to the conventions specified at [technicalpickles/homesick](https://github.com/technicalpickles/homesick)

## Dotfiles Setup

```
gem install homesick --no-document
homesick clone chrislopresto/dotfiles
homesick symlink dotfiles --force
```

## Environment Provisioning

I use [thoughtbot/laptop](https://github.com/thoughtbot/laptop) to provision environments in a repeatable, idempotent fashion. The laptop script allows a user to specify additional install commands in a dotfile, which I obviously maintain in this repository [here](https://github.com/chrislopresto/dotfiles/blob/master/home/.laptop.local). I include the **Dotfiles Setup** commands specified above (among others) in this file.

This leads to a bootstrapping problem, since the laptop script needs the `.laptop.local`file before it has a chance to clone the `chrislopresto/dotfiles` repository. Furthermore, the commands in the `.laptop.local` file presuppose a Sublime Text install. So some manual bootstrapping is required prior to running the laptop script.

- Install [Sublime Text](http://www.sublimetext.com/3)
- Install Sublime Text Package Control
    - Copy the Package Control [install script](https://sublime.wbond.net/installation#st3)
    - Launch Sublime Text
    - Launch the Sublime Text console: ``ctrl+` ``
    - Paste and execute the Package Control install script
- Copy the latest version of the `.laptop.local` shim script
    `cd ~ ; curl https://raw.githubusercontent.com/chrislopresto/dotfiles/master/home/.laptop.local -o .laptop.local ; cd -`
- Execute the latest version of the [laptop script](https://github.com/thoughtbot/laptop)

Note that pairing the `homesick clone`/`pull` commands and the `homesick unlink`/`symlink` commands allows the script to be run repeatedly. Homesick spits out warnings that can be safely ignored.

## Environment Setup

- Install iTerm
    - Load preferences from `~/.homesick/repos/dotfiles/iterm2`
- Map `CAPS LOCK` to `CTRL`
- Install [Source Code Pro](http://sourceforge.net/projects/sourcecodepro.adobe/files/latest/download)
    - Future releases will be available on [GitHub](https://github.com/adobe-fonts/source-code-pro/releases)
- Install Dropbox
    - [Experimental Yosemite build](https://forums.dropbox.com/topic.php?id=121664)
- Install 1Password
- Install Alfred
    - Activate Powerpack
    - Set sync folder to `~/Dropbox/Alfred`
- Install Tower
    - Activate
    - Install command line utility

## Icons and Things

This will change over time. Use as desired.

- Sublime
    - https://dribbble.com/shots/1827862-Yosemite-Sublime-Text-Icon
