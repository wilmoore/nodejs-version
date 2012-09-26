nodejs-version: stupid simple NodeJS version switching
============================================================


**nodejs-version** exposes a single command `nodejs-version` allowing developers to switch between multiple versions of NodeJS.

**nodejs-version** is conceptually similar to [rbenv](https://github.com/sstephenson/rbenv); however, **much** `simpler`.

**nodejs-version** consists of a single function and shell completion.

**nodejs-version** lives in a single file which can be sourced into your shell profile.

**nodejs-version** considers leaky abstractions to be a huge flailing `fail`.


Who is it for?
----------------------------

**nodejs-version** is primarily for developers wanting multiple versions of NodeJS on Linux or Mac.


Who is it _NOT_ for?
----------------------------

If you are a super neck-beard academic, you are likely already doing this as `a matter of fact` as part of your normal workflow;
in which case, **nodejs-version** is likely not going to be very interesting to you. I respect that :)


Rationale
----------------------------

**nodejs-version** attempts to stick to the classic UNIX notion that tools should do one thing well.

>   While there are tools that attempt to [solve](http://www.gnu.org/s/stow/) this problem, none of the tools I've found were simple enough for me.

**nodejs-version** is excellent for automated testing of applications against multiple NodeJS versions on a single machine.


Features
----------------------------

-   keep it simple...no magic
-   promotes multiple, per-user NodeJS installs
-   shell completion (e.g. nodejs-version 0.[PRESS-TAB-NOW])
-   provides access to the manpages of the current version by updating your `$MANPATH` environment variable
-   unobtrusive install/uninstall (we won't leave files and symlinks all over the place)


Non-Features
----------------------------

-   does not rely on symlinks or sub-shells
-   does not attempt to compile, build, or install NodeJS (you might be interested in [nodejs-latest](http://github.com/wilmoore/nodejs-latest))


Usage Examples
----------------------------

**Switch to a specific NodeJS version**

    % nodejs-version <version>

**List installed NodeJS version(s)**

    % ls $NODEJS_VERSIONS

**Identify the active NodeJS version**

    % echo $NODEJS_VERSION

**View manual pages**

    % man node


Download and Installation
----------------------------

**Standard Install**

    % mkdir -p $HOME/local/nodejs-version
    % cd !$
    % curl -# -L https://github.com/wilmoore/nodejs-version/tarball/master | tar -xz --strip 1
    % cd -

**Homebrew**

    % brew install nodejs-version


Activate Default NodeJS version
----------------------------

Add the following script block to `$HOME/.bashrc`, `$HOME/.zshrc`, or your shell's equivalent configuration file:

Change `0.x.x` to the version of NodeJS you'd like your shell to default to or remove `nodejs-version 0.x.x >/dev/null` if you do not wish to have a default version of NodeJS loaded when you start a terminal session.

**for standard installs (the comment block is optional)**

    ########################################################################################
    # nodejs-version (activate default NodeJS version and autocompletion)
    # export NODEJS_VERSIONS                  => base location of NodeJS versions
    # export NODEJSVERSION_DISABLE_COMPLETE=1 => to disable shell completion
    ########################################################################################
    export NODEJS_VERSIONS=${HOME}/local/nodejs
    source $HOME/local/nodejs-version/nodejs-version.sh &&
      nodejs-version 0.x.x >/dev/null

**for Homebrew installs (the comment block is optional)**

    ########################################################################################
    # nodejs-version (activate default NodeJS version and autocompletion)
    # export NodeJS_VERSIONS                  => base location of NodeJS versions
    # export NODEJSVERSION_DISABLE_COMPLETE=1 => to disable shell completion
    ########################################################################################
    export NODEJS_VERSIONS=$(dirname $(brew --prefix node))
    source $(brew --prefix nodejs-version)/nodejs-version.sh
      && nodejs-version 0.x.x >/dev/null


Deactivate / Uninstall
----------------------------

**Remove Configuration**

From your `$HOME/.bashrc`, `$HOME/.zshrc`, or your shell's equivalent configuration file remove the above mentioned configuration block.

**Remove Files**

    % rm -rf /path-to/nodejs-version # or (brew uninstall nodejs-version)


Switching Versions
----------------------------

**Call it like this in your terminal**

    $ nodejs-version 0.8.9

**Bash Completion**

    % nodejs-version 0.[PRESS-TAB-NOW]


Inspiration
----------------------------

-   [n](https://github.com/visionmedia/n)
-   [nvm](https://github.com/creationix/nvm)
-   [rbenv](https://github.com/sstephenson/rbenv)
-   [rbfu](https://github.com/hmans/rbfu)
-   [ry](https://github.com/jayferd/ry)


LICENSE
------------------------------

    (The MIT License)

    Copyright (c) 2012 Wil Moore III <wil.moore@wilmoore.com>

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is furnished
    to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.

