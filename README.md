# Renard configuration files


This repositiory contains my public configuration files. It works for
me™. Please note that I will not provide support of any kind for it.

## Prerequisite

You first need to install both [vcsh](https://github.com/RichiH/vcsh) and
[myrepos](https://github.com/joeyh/myrepos). Please refer to your OS
documentation on how to install those tools on your computer.

## `.mrconfig` file

Now you can create a `.mrconfig` file which contains something like that:

    [DEFAULT]
    git_gc = git gc "$@"
    
    [$HOME/.config/vcsh/repo.d/dotfiles.git]
    checkout =
      vcsh clone https://github.com/renard/dotfiles.git
    
    push =
      vcsh dotfiles push

## cloning this repository

You can clone the repository using `mr`:

	mr update

If a file is present in your home directory you will first need to remove it
before running `mr` again.

## Advanced usage

If you already use `mr` with other sources you may want to split your
`.mrconfig` file using something like that:

In `~/.mrconfig`:

    [DEFAULT]
    git_gc = git gc "$@"
    
    include = cat $HOME/.config/myrepos/*.conf

In `~/.config/myrepos/dotfiles.conf`:

    [$HOME/.config/vcsh/repo.d/dotfiles.git]
    checkout =
      vcsh clone https://github.com/renard/dotfiles.git
    
    push =
      vcsh dotfiles push
