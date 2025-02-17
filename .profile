# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=1024×768
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

if [ -d "/home/dushan/anaconda3/pkgs/libcublas-12.1.0.26-0/lib/ " ]; then
	    export PATH=/home/dushan/anaconda3/bin${PATH:+:${PATH}}
	    export LD_LIBRARY_PATH=/home/dushan/anaconda3/pkgs/libcublas-12.1.0.26-0/lib/${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi


if [ -d "$HOME/.local/bin" ]; then
	    PATH="$HOME/.local/bin:$PATH"
fi

export PATH=$PATH:/usr/local/go/bin

