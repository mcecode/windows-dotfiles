# Windows Dotfiles

This repository contains the dotfiles that I use to set up a development environment on Windows using the following:

- [Visual Studio Code](https://code.visualstudio.com) (VSC), as the main editor
- [Vim](https://www.vim.org), as the secondary editor
- [Git Bash](https://gitforwindows.org/#bash), as the terminal
- [Fira Code](https://github.com/tonsky/FiraCode), as the main font
- [Git](https://git-scm.com), for version control

I manage these files using Git [bare repositories](https://git-scm.com/docs/gitglossary.html#Documentation/gitglossary.txt-aiddefbarerepositoryabarerepository). I got the idea from [Flavio Antelo's blog post](https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b) who got it from [StreakyCobra on Hacker News](https://news.ycombinator.com/item?id=11070797).

## Installation on a new system

1. Install [VSC](https://code.visualstudio.com/Download) and make `code` available in your PATH.
2. Install [Git for Windows](https://git-scm.com/download/win) and make `git` available in your PATH.
3. Install [Fira Code](https://github.com/tonsky/FiraCode/releases). ([Instructions](https://github.com/tonsky/FiraCode/wiki/Installing#windows))
4. Use [Noto Emoji](https://github.com/googlefonts/noto-emoji/releases) to support emojis on Git Bash.

   You can follow [these instructions](https://github.com/mintty/mintty/wiki/Tips#installing-emoji-resources), but long story short, use [this link](https://downgit.github.io/#/home?url=https://github.com/googlefonts/noto-emoji/tree/main/png/128) from [DownGit](https://github.com/MinhasKamal/DownGit) to download the contents of [`noto-emoji/png/128`](https://github.com/googlefonts/noto-emoji/tree/main/png/128) and put them in any of the following directories:

   - `%USERPROFILE%\.mintty\emojis\noto`
   - `%USERPROFILE%\.config\mintty\emojis\noto`
   - `%APPDATA%\mintty\emojis\noto`
   - `%PROGRAMFILES%\Git\usr\share\mintty\emojis\noto`

5. Using Git Bash, clone this repository into a `.dotfiles` directory in your home directory:

   ```console
   git clone --bare https://github.com/mcecode/windows-dotfiles.git "$HOME/.dotfiles"
   ```

6. Checkout the dotfiles from the bare repository:

   ```console
   git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout
   ```

7. Reload Git Bash to allow the settings to take into effect.
8. `%USERPROFILE%\.config\bash\.bashrc` adds the `dotfiles` alias to easily work with the dotfiles bare repository. Using this command, set `dotfiles status` to hide untracked files:

   ```console
   dotfiles config --local status.showUntrackedFiles no
   ```

9. In Windows Settings > Update & Security > For developers, apply the setting that allows local PowerShell scripts to run without signing. This will enable you to run `update-extensions.ps1` in the next step.
10. Run `%USERPROFILE%\.vscode\update-extensions.ps1`. This will install the VSC extensions listed in `%USERPROFILE%\.vscode\extensions.txt`.
11. Put any additional Bash settings like machine-specific variables and Git settings like user credentials in `%USERPROFILE%\.config\local\.bashrc` and `%USERPROFILE%\.config\local\.gitconfig`, respectively.

## Syncing the dotfiles

1. On the machine with the changes, run `dotfiles add <changed_file>` and `dotfiles commit -m "<meaningful_message>"`.
2. On other machines, run `dotfiles pull`.

## Syncing Visual Studio Code extensions

1. On the machine with the newly installed or uninstalled extensions, run `code --list-extensions > extensions.txt` inside the `%USERPROFILE%\.vscode` directory.
2. Commit and push `extensions.txt` using the `dotfiles` command.
3. Pull updates on other machines using the `dotfiles` command.
4. On other machines, run `%USERPROFILE%\.vscode\update-extensions.ps1` to sync VSC extensions.

P.S. Yes, I know this is a cumbersome way to update them, but I rarely install or uninstall extensions, so this is fine for me right now.

P.P.S. In hindsight, I think it would have been better if I wrote the update script in Bash rather than PowerShell since these dotfiles promote using Git Bash anyway. At some point, I will probably re-write it in Bash, but for now, I digress.

## Contributing

Suggestions are welcome, either in improving the dotfiles themselves or on how to store, update, and sync them better.

## License

Copyright 2021-present Matthew Espino

This project is licensed under the [MIT license](LICENSE).
