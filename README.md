Bubba's Dot Files
=================

A framework for managing my dotfile at work and at play. The most elegant way I have [found][5] to store my dotfiles is in a bare Git repository.

Prerequisites
-------------
- [git][1]
- [neovim][2]
- [zsh][3]

Installation
------------

Define the `config` alias in the current shell scope.
```sh
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Clone the files into a [bare][4] repository in a "dot" folder of your **$HOME**
```sh
git clone --bare --recurse-submodules -j8 https://github.com/bubba-h57/dotfiles.git $HOME/.dotfiles
```

Checkout the actual content frome the bare repository into your **$HOME**
```sh
config checkout
```

Ensure all the submodules are updated.
```sh
config submodule update --recursive
```

Set the flag showUntrackedFiles to no on this specific (local) repository:
```sh
config config status.showUntrackedFiles no
```

Maintenance
-----------
You're done, from now on you can now type config commands to add and update your dotfiles.
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .zshrc
config commit -m "Add zshrc"
config push
```

Starting From Scratch
---------------------
So you want to manage your dotfiles like this as well?
```
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```
After you've executed the setup any file within the $HOME folder can be versioned with normal commands, replacing `git` with your newly created `config` alias

[1]: https://git-scm.com/
[2]: https://neovim.io/
[3]: http://www.zsh.org/
[4]: http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/
[5]: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
