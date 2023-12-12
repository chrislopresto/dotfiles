# chrislopresto dotfiles

These are my dotfiles.

## Installation


```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone https://github.com/chrislopresto/dotfiles "${HOME}/.dotfiles"
cd "${HOME}/.dotfiles"
./script/setup
rcup
```

## Git config

### Configure git

Choose personal or work git config via tags.

```sh
rcup -t personal
rcdn -t personal
rcup -t work
rcdn -t work
```

### Configure SSH key for commit signing

Follow [1Password instructions to configure git commit signing with SSH](https://developer.1password.com/docs/ssh/git-commit-signing#step-1-configure-git-commit-signing-with-ssh) for "GitHub SSH Key".
