# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
kill -9 `ps -e |grep kde-auth|sed 's/^ *//'|cut  -d " " -f 1`
killall -9 gpg-agent

if ! ps aux | grep -q [e]nable-ssh-support
 then
  killall gpg-agent
  /usr/bin/gpg-agent --daemon --enable-ssh-support ;
  cat "${HOME}/.gpg-agent-info" > /dev/null
fi;
if [ -f "${HOME}/.gpg-agent-info" ]; then
     . "${HOME}/.gpg-agent-info"
       export GPG_AGENT_INFO
       export SSH_AUTH_SOCK
       export SSH_AGENT_PID
fi
PATH=${PATH}:${HOME}/bin:/home/ranjit/.local/bin
export PATH="/usr/lib/ccache/bin${PATH:+:}$PATH"
export CCACHE_DIR="/var/cache/ccache"

export GPG_TTY=/dev/pts/2
gpg-connect-agent updatestartuptty /bye
unset SSH_AGENT_PID
export SSH_AUTH_SOCK=/run/user/1001/gnupg/S.gpg-agent.ssh

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export APRIL_MODEL_PATH=/home/ranjit/bin/LiveCaptions/builddir/aprilv0_en-us.april
export ONNX_ROOT=/home/ranjit/bin/onnxruntime-linux-x64-1.13.1/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ranjit/bin/onnxruntime-linux-x64-1.13.1/lib

PATH="$HOME/.local/bin:$PATH"
export LESS="-X"


source /usr/share/bash-completion/completions/fzf
source /usr/share/fzf/key-bindings.bash


PATH="/home/ranjit/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ranjit/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ranjit/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ranjit/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ranjit/perl5"; export PERL_MM_OPT;

PAGER=less LESS=R

export NPM_CONFIG_PREFIX=$HOME/.local/
export PATH="/home/$USER/go/bin:/home/$USER/.local/bin:$NPM_CONFIG_PREFIX/bin:$PATH"

clear && `which neofetch`
