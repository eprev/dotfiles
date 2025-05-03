# ~/.\*

![](screenshot.png)
![](screenshot-vim.png)

## Setup

1. Run:

   ```
   curl -L https://github.com/eprev/dotfiles/raw/master/bin/dot-install | zsh
   ```

2. Don't forget to update user details in `~/.gitconfig`.

3. In addition, the following steps may be required:

   - If you want to use [TagBar](http://preservim.github.io/tagbar/), you need to install ctags-universal (or simply run `dot-install-osx`):

     ```
     brew install universal-ctags
     ```

   - You might want to try [locationchanger](https://github.com/eprev/locationchanger).

   - Like the font in the screenshot? It's [Input Font](http://input.fontbureau.com/) (InputMonoCondensed-Light, 13pt).

## Update

```
dot-update
```
