# INSTALL

This document contains all step-by-step instructions on how to install and configure your development environment like mine. As mentioned earlier in the main page, almost every single command are for MacOS, so if you have a different operating system, these commands may work wrongly or make unexpected changes. Lastly, if you are struggling with this instruction, please make an issue [here](https://github.com/nuvut/dotfiles/issues/new/).

Okay, let's open your terminal and play with some commands.

## 1. Install Brew

Brew is a package manager for Mac and Linux. We will install plenty of formulaes and casks using the `brew` commands. You can search all formulaes and casks uploaded to brew [here](https://brew.sh/).

> The command below will install Brew for you. You will need to hit the enter key and enter your Mac's password.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)”\
```

> Run these two commands below if you have errors in the last few lines. They will allow you to run the `brew` command, which would have happened before.

```
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/nuvut/.zprofile

eval "$(/opt/homebrew/bin/brew shellenv)"
```

**It is recommened to close and re-open your terminal after these steps.**

## 2. Install Formulaes

`brew install` allows you to install formulaes. The list below the command includes all formulae that this command will install. If you do not want to install one or some of those formulas, you can simply find and remove the specific ones from the command.

```
brew install neovim visual-studio-code node bun fish git npm ppm yarn bat eza stylua fzf
```

- [neovim](https://neovim.io/)
- [Visual Studio Code](https://code.visualstudio.com)
- [node](https://nodejs.org/en/)
- [bun](https://bun.sh/)
- [git](https://git-scm.com/)
- [npm](https://www.npmjs.com/)
- [pnpm](https://pnpm.io/)
- [yarn](https://yarnpkg.com/)
- [fish](https://fishshell.com/)
- [bat](https://github.com/sharkdp/bat/)
- [eza](https://eza.rocks/)
- [fzf](https://github.com/junegunn/fzf/)
- [stylua](https://github.com/JohnnyMorganz/StyLua/)
- [flake8]
  `pip3 install flake8`

## 3. Install Casks

If you add the `--cask` flag after the `brew install` command, you can install applications(casks) that you can click to execute. The list below contains all the casks installed by the command. If you have some casks that you are not willing to install, do the same thing as the previous step.

```
brew install --cask grammarly-desktop miro github sourcetree craft iterm2 google-chrome rectangle font-hack-nerd-font
```

- [iTerm2](https://iterm2.com/)
- [GitHub Desktop](https://github.com/apps/desktop/)
- [SourceTree](https://www.sourcetreeapp.com/)
- [Craft](https://www.craft.do/)
- [miro](https://miro.com/)
- [Google Chrome](https://www.google.com/chrome/)
- [Grammarly Desktop](https://www.grammarly.com/desktop/)
- [Rectangle](https://rectangleapp.com/)
- [Font Hack Nerd](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack/)

Now, it is time to open `iTerm2` and work on the shell interfaces and their customization.

## 4. Install fisher and plugins

Fisher is a package manager like `brew`, but it is for the fish shell. We will install `z` and `tide`: `z` for quick moves between different directories and `tide` for shell customization.

### Install [`fisher`](https://github.com/jorgebucaran/fisher/)

```
fisher install jorgebucaran/fishecurl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisherr
```

### Install Fish plugins

```
fisher install jethrokuan/z
fisher install IlanCosman/tide@v6git config --list --show-origin
```

You can customize your shell using this `tide configure` command.

## 5. Configure the iTerm2

1. Open the iTerm2 application(you can run `open -a iTerm` in terminal or click the icon on the Applicaiton folder.)
2. press `command` and `,` to open the setting window once you open it.
3. Go to Profiles -> General -> Basics -> Name, and set your session to whatever you want.
4. Go to Appearance -> General -> Theme, and apply `./iterm/colourscheme.itermcolors` by clicking `Color Presets`, `Import...`, and selecting this specific `.itermcolors` file.
5. Go to Profiles -> Text -> Font, and apply the `Hack Nerd Font`.
6. Go to Profiles -> Window -> Transparency/Blur, and increase the transparency and blur value to 30 and 64(max) after turning on the blur checkbox.

## 6. Configure the fish / nvim by installing this GitHub repository

Cloning this repository to the `~/.config` will allow you to set the configurations precisely like mine. This repository contains all `fish` and `lua` files for the fish shell and the neovim.

```
git clone https://github.com/nuvut/dotfiles ~/.config
```

### Markdown.preview

If you want to use the `markdown-preview.nvim` plugin, please run these four commands. These will install the needed packages and make connections between the Next.js server, which this plugin is based on, and the Neovim file buffer so that you can do the preview of your markdown files(any files with `.md` or `.mdx` file extension).

```
cd ~/.local/share/vim/site/pack/deps/opt/markdown-preview.nvim
bun install
cd ./app
sh ./install.sh
```

## 7. Set up your SSH key and upload it to GitHub

To set up your SSH, just run these five commands and follow the instructions below. **Do not forget to change "your email" section to your real email.**

```
ssh-keygen -t ed25519 -C "your email"

sudo -s -H eval "$(ssh-agent -s)"

touch ~/.ssh/config

echo "Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
" > ~/.ssh/config/

pbcopy < ~/.ssh/id_ed25519.pub
```

1. Go to `https://github.com/settings/ssh/new`
2. Set the title to anything you want it to be called. You will never see it later unless you get a new device.
3. Paste the key into the content box. The command you just ran in the previous step must have copied your key.
4. Click the `Add SSH Key` button.
5. You Should get an email from GitHub saying a new SSH Key has recently been added.

## 8. Finishing

Before continuing further, please reboot your computer to make sure that nothing gose wrong.
