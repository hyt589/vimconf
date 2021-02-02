#!/bin/bash

set -e

SCRIPT_ROOT="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
VIM_HOME="$HOME"
NEOVIM_HOME="$HOME/.config/nvim"

mkdir -p $NEOVIM_HOME

ln -sf "$SCRIPT_ROOT/init.vim" "$VIM_HOME/.vimrc"
ln -sf "$SCRIPT_ROOT/init.vim" "$NEOVIM_HOME/init.vim"

[[ -s $NVM_DIR/nvm.sh ]] && . $NVM_DIR/nvm.sh

if ! type -t nvm &> /dev/null
then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
fi

if ! command -v conda &> /dev/null
then
    curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --output Miniconda3-latest-Linux-x86_64.sh
    sh Miniconda3-latest-Linux-x86_64.sh
    rm -f Miniconda3-latest-Linux-x86_64.sh
fi

nvm install node
npm install -g neovim

[[ -s $CONDA_PREFIX/etc/profile.d/conda.sh ]] && . $CONDA_PREFIX/etc/profile.d/conda.sh
conda activate
python -m pip install --user --upgrade pynvim
pip install ranger-fm

cd $SCRIPT_ROOT

echo 'Set up complete.'
echo 'You can pull the nerd-fonts submodule to patch the fonts if you want to.'
echo '    run: git submodule update --init --recursive --depth 1'
echo 'Beware it is a huge repo'
