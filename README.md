# Requirements
- Ubuntu 20.04
- Neovim 0.6.1
- FiraCode Mono
- Vim-Plug

# Instructions
1. Install `neovim` by adding the neovim stable [PPA](https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable)
```sh
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim
```

2. Install patched font: [FiraCode Mono](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf)

3. Install [vim-plug](https://github.com/junegunn/vim-plug)
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

4. Run the link script: `./link.sh`
