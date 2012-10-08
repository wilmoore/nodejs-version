Unobtrusive, non-destructive, NodeJS version switching
============================================================


**nodejs-version** exposes a single command `nodejs-version`, including command completion, allowing developers to toggle between multiple versions of NodeJS.

**nodejs-version** is conceptually similar to **[nvm][nvm]** and **[n][n]**; but lighter.

**nodejs-version** lives in a single file which can be sourced into your shell.

**nodejs-version** encourages a `no-sudo` (i.e. no `/usr/local`) approach to installation of NodeJS.

**nodejs-version** considers leaky abstractions to be undesirable in favor of the classic UNIX notion of solid, single-purpose tools.


Who is it for?
----------------------------

**nodejs-version** is primarily for developers working with multiple versions of NodeJS on Linux or Mac. (Window/PowerShell version will likely be available in the near future).


Features
----------------------------

-   shell completion (`nodejs-version 0.[TAB]`)
-   provides access to the NodeJS programs and manpages by updating `$PATH` and `$MANPATH` environment variables
-   access to the manpages of the current version by updating your `$MANPATH` environment variable
-   unobtrusive and non-destructive (no sudo, symlinks, or sub-shells)
-   does not attempt to compile, build, or install NodeJS (though you might be interested in [nodejs-latest][nodejs-latest])


Usage Examples
----------------------------

**Switch to a specific NodeJS version**

    % nodejs-version <version>

**List installed NodeJS version(s)**

    % ls -A1 $NODEJS_VERSIONS

**Identify the active NodeJS version**

    % echo $NODEJS_VERSION

**View manual pages**

    % man node


Download and Installation
----------------------------

**Install/Upgrade**

    % rm -rdfi $HOME/local/nodejs-version
    % mkdir -p $HOME/local/nodejs-version
    % cd !$
    % curl -# -L https://github.com/wilmoore/nodejs-version/tarball/master | tar -xz --strip 1
    % cd -

**NOTE**: `$HOME/local/nodejs-version` is only the suggested location; put it anywhere you like. It does not have to be in your `$PATH`.

**Activate**

Add the following lines to `$HOME/.bashrc`, `$HOME/.bash_profile`, `$HOME/.zshrc`, or your shell's equivalent configuration file:

    export NODEJS_VERSIONS=${HOME}/local/nodejs
    source $HOME/local/nodejs-version/nodejs-version.sh

**Optional Configuration**

-   You can have your terminal sessions default to a particular NodeJS version with `nodejs-version 0.x.x >/dev/null`  (where `0.x.x` is the version of your choice).
-   You can change where the program looks for NodeJS installations with `export NODEJS_VERSIONS=/path/to/nodejs/versions`.
-   You can disable shell completion with `export NODEJSVERSION_DISABLE_COMPLETE=1`.


Version Toggling
----------------------------

    % nodejs-version 0.8.9

*or*

    % nodejs-version 0[TAB]


Deactivate / Uninstall
----------------------------

From your `$HOME/.bashrc`, `$HOME/.bash_profile`, `$HOME/.zshrc`, or your shell's equivalent configuration file remove the configuration block, then:

    % rm -rdfi $HOME/local/nodejs-version


Complementary Resources
----------------------------

-   [nodejs-latest][nodejs-latest]


Inspiration
----------------------------

-   [nvm][nvm]
-   [n][n]


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




[nvm]:            https://github.com/creationix/nvm
[n]:              https://github.com/visionmedia/n
[nodejs-latest]:  https://github.com/wilmoore/nodejs-latest
