This repo tracks my dotfiles using the git --bare repo method. 

[see this link for details](https://www.atlassian.com/git/tutorials/dotfiles)

To clone to a new system

`echo ".cfg" >> .gitignore`  
`git clone --bare <git-repo-url> $HOME/.cfg`  
`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`  
`config checkout`  

This might generate the following error:  
```shell
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

If so, move the offending files to a backup, e.g. `config.backup`, then try again:  
`config checkout`  

This step is important, so you don't show every file in `$HOME` as untracked.  
`config config --local status.showUntrackedFiles no`  


To update the dotfiles in the repo:  
```
config status
config add .vimrc
config commit -m "Add vimrc"
config push
```
