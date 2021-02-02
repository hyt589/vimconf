# Overview

This is my personal vim configuration repo.

## How to use

1. Backup your `.vimrc` or `init.vim` if you are using `nvim`
2. Clone this repo
3. Run `setup.sh` which will setup the proper dependencies
4. Open `vim` or `nvim` will automatically install plugins
5. [vim-devicons](https://github.com/ryanoasis/vim-devicons) will not work unless you have patched [nerd fonts](https://github.com/ryanoasis/nerd-fonts). You should disable the devicons plugins in `plugins.vim` if you do not want to patch the fonts.
6. If you decide to patch the fonts, there are two things you should know. First, you should patch the fonts on the machine where your terminal emulator is launched from. For example, if you are using vim remotely via `ssh`, then you should patch the fonts on you local machine rather than the remote machine. Second, the easiest way to patch the fonts is to clone the repo or use the submodule of this repo, and run the install script. Beware that `nerd fonts` is a huge repo since it contains a lot of fonts.

## Documentation

Documentation about this configuration is WIP
