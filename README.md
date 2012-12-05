# parkr does dotfiles, courtesy of tombell

## ~ is where the ♥ is

My dotfiles were originally a fork of @tombell's dotfiles, which were originally
a fork of @holman's dotfiles.

Your dotfiles are you personalised configuration files for UNIX-like systems,
they usually reside in your home (`~`) directory.

Like @tombell's and @holman's, my dotfiles are organised into topics (ruby, git, 
zsh etc). For more information about dotfiles and @holman's specifically check out his
[repo][holman-repo] and [blog post][holman-post] on the subject.

[holman-repo]: https://github.com/holman/dotfiles
[holman-post]: http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/

## Install

* `git clone git://github.com/parkr/dotfiles ~/.dotfiles`
* `cd ~/.dotfiles`
* `git submodule init`
* `git submodule update`
* `rake install`

The install rake task will symlink all the correct files from `~/.dotfiles` to
your home directory. You will want to configure and tweak everything inside the
`~/.dotfiles` directory though.

## Components

Taken from @holman's, there are a few special files in the repository:

* `bin/`, anything in `bin/` will get added to your `$PATH` and made available
  everywhere
* `<topic>/*.zsh`, any files ending with `.zsh` will get loaded into your
  environment
* `<topic>/*.symlink`, any files ending with `.symlink` will get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded in your home directory. These get symlinked
  when you run `rake install`
* `<topic>/*.completion.sh`, any files ended in `completion.sh` get loaded last
  so that they get loaded after we set up zsh autocomplete functions

## Extras

There are a few things I use to make my life awesome. They're not a required
dependency, but if you install them they'll make your life more awesome as
well.

* If you want some more colours for things like `ls`, install `grc`:
  `brew install grc`
* If you want `rvm` or `rbenv` to manage your ruby installs, install either and
  you'll get the current ruby version in your prompt

## Bug

Just open an issue and/or pull request.

## Thanks

I originally forked @tombell's dotfiles, who originally forked @holamn's dotfiles, who originally forked @ryanb's dotfiles.
So thanks to them.
