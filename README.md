# WSL-bootstrap

This project aims to bootstrap your WSL distribution (currently only Ubuntu supported)
with opinionated development tools and configs.
Before you start using this repo, please install WSL following the
[official documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10#for-anniversary-update-and-creators-update-install-using-lxrun).

__Please choose Ubuntu as it is the only Linux distribution which is fully supported
by WSL-bootstrap__

Once WSL and Ubuntu installed, proceed next.

## Configure your terminal

### WSLtty (preffered)
For a better development experience with WSL, install the [WSLtty](https://github.com/mintty/wsltty/releases)
terminal.

### Hyper (for hipsters)
You might prefer [Hyper](https://hyper.is) terminal which is kind of a hipsterish.
But I couldn't configure it properly to work with tmux under WSL.  In case you don't
care about using tmux, than Hyper is a way to go. Once Hyper is installed, open it's
configuration file (Ctrl+Comma), find `shell` and `shellArgs` parameters and assign
them the following values:

```
shell: 'wsl.exe'
shellArgs: ['~'],
```

Now you will be dropped into your WSL shell every time you launch Hyper.

To make Hyper Terminal even more awesome, install one of the
[awesome themes](https://github.com/bnb/awesome-hyper#themes), for example
hyper-atom-dark-transparent. Add this to your Hyper config (Ctrl+Comma):

```
plugins: ['hyper-atom-dark-transparent'],
```

### Terminal font

WSL-bootstrap uses Powerline symbols to make your console look awesome. In order to
display those symbols correctly, on your Windows host install one of your favourite
fonts patched with Powerline symbols from the awesone
[nerd-fonts](https://github.com/ryanoasis/nerd-fonts/releases) repository.
Just pickup the font you like, download the archive, extract, select all the Mono
Windows Compatible fonts, right click -> Install. SourceCodePro font is highly recomended.

Once Powerline font is installed, open the Hyper config file (Ctrl+Comma) and
specify your font like this:

```
fontFamily: '"SauceCodePro NF", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
```

Restart Hyper and you should be dropped into your Linux shell with specified font.

__NOTE__ For some reasons WSLtty displays only monochrome fonts under its settings
thus most of the the NerdFonts are not available for setting via GUI, but you still
may set the font of your choice via the `config` file located in the `%APPDATA\wsltty`
directory:

```
...
Font=SauceCodePro NF
...
```

## Install WSL-bootstrap

Now when you've istalled WSL and a terminal of your choice, open your WSL
distribution, navigate to the `home` folder (`cd ~`) and clone this repo (git
should be already preinstalled in your distribution):

```sh
git clone https://github.com/cyxou/wsl-bootstrap.git
```

Once again, make sure that the cloned `wsl-bootstrap` folder is located in the
`/home/<your_linux_user>` folder in your Linux distro. If you've decided to clone
this repo to another folder, than open the `./group_vars/local` file and set the 
correct path to the cloned folder under the `wsl_bootstrap_home` variable. For
the rest of this doc it's assumed that `wsl-bootstrap` is cloned to your home
folder.

## Bootstrapping your Linux distribution

Now when you have your Linux shell opened it's time to bootstrap it.
Bootstrapping is performed by Ansible. So the first step is to install Ansible.
You can do it manually following
[official documentation](http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-apt-ubuntu)
or using the *install_ansible_ubuntu.sh* bash script:

```sh
sudo ~/wsl-bootstrap/bin/install_ansible_ubuntu.sh
```

### Docker for Windows and Docker Toolbox

If you have to use Docker Toolbox for running docker on Windows, then set
`docker_toolbox: yes` in the ./group_vars/local file. Otherwise, WSL will be
configured for working with Docker for Windows asuming you have exposed docker
daemon port in docker settings.

### Run Ansible playbook

To bootstrap your Ubuntu installation, run:

```sh
~/wsl-bootstrap/bin/wsl-bootstrap
```

Ansible will ask for your SUDO password. Type it in and go get a cup of coffee.
When bootstraping completes, close the terminal and open it again. Enjoy!
