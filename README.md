# chrislopresto dotfiles

These are my dotfiles.

## Installation


```sh
git clone https://github.com/chrislopresto/dotfiles "${HOME}/.dotfiles"
cd "${HOME}/.dotfiles"
./script/setup
rcup
```

### Git config

Choose personal or work git config via tags.

```sh
rcup -t personal
rcdn -t personal
rcup -t work
rcdn -t work
```

Add git user signingkey config to `tag-personal/gitconfig.local` or `tag-work/gitconfig.local`.

```
[user]
  signingkey = XXXXXXXXXXXXXXXX
```
