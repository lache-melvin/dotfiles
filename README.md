# Dotfiles
> Config files for the macOS + Zsh situation I have going on, and some scripts to get us vibing (and the addition of some other config for Arch Linux :tada:)

## linkup
Running the `linkup` script will create symlinks from config files in this repo to where Zsh most desires them to be.

Before running, make sure the `DOTFILES` variable in both `./linkup` and `./zsh/.zshenv` is the path to this repo.

Also ensure `NVM_DIR` (`./misc/nvm`) and `ZSH` (`./zsh/.zshenv`) are the correct paths for your OS.

```
git clone https://github.com/lache-melvin/dotfiles.git
cd dotfiles
./linkup
```

### What goes down
- symlinks zsh config files in `./zsh` to `~`
    - `.zshenv` sets up environment vars
    - `.zprofile` sources `./paths` on login (my iTerm is set to consider every new shell a login shell)
    - `.zshrc` initialises [oh-my-zsh](https://ohmyz.sh/), sources `./aliases`, `./functions` and some of the files in `./misc` for interactive shell sessions
- symlinks `./.gitconfig` to `~/.gitconfig`
- symlinks files in `./config` to wherever they most prefer in `~/.config`


You're going to need to install oh-my-zsh, [vim-plug](https://github.com/junegunn/vim-plug) and [nvm](https://github.com/nvm-sh/nvm#installing-and-updating) yourself.

## npmig
> cute idea [@don-smith](https://github.com/don-smith)

Running the `./npmig` script will install the global npm packages I'm currently using (I endeavour to keep this up to date)

### When moving to a new node version with nvm
Install a new node version and reinstall packages from current version:
```
nvm install <new-version> --reinstall-packages-from=<current-version>
```
If you've already installed the new version:
```
nvm reinstall-packages <from-version>
```
