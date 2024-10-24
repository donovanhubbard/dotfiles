# dotfiles

My terminal configuration files.

Designed for use with GNU stow.

## Install

First get GNU stow installed.

```
brew install stow
```

Then clone the repo into your `$HOME` directory.

Navigate to the dotfiles repo directory, and pick which app you want to install.
In this case we'll do nvim. Run

```
stow nvim
```

## Adding new applications

Create a new directory in the root of this directory. This is the name of the package.

Everything underneath this directory will be placed into the directory above this root
directory. So assuming this is in your `$HOME` directory which it should be, and you want
a file at `$HOME/.foo.conf` then you want to create the file `$HOME/dotfiles/foo/.foo.conf`
To install the package Run

```bash
stow foo
```

