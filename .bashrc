#EXPORTS
export VISUAL="vim"
export EDITOR="vim"
export browser="firefox"
export MYSCRIPTS="/home/rafal/.myScripts"
export JAVA_HOME="usr/lib/jvm/java-1.8.0-openjdk-amd64"
export PYCHARM="/opt/pycharm-community-2020.2.5/bin"
export PATH="$JAVA_HOME/bin:$MYSCRIPTS:$PYCHARM:$PATH"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/pulse/extra/usr/lib/x86_64-linux-gnu/"

#ALIASES
alias gitlog="git log --pretty=oneline"
alias cdd="cd ~/Desktop"
alias cdo="cd ~/Downloads"
alias n="nautilus ."
alias ls="ls --color=auto"
alias vimrc="vim ~/.bashrc"
alias pg="ping www.google.com"
alias ka="killall"
alias vimmnd="vim ~/.xmonad/xmonad.hs"
alias vimmbr="vim ~/.config/xmobar/xmobarrc"
alias checkClassName="xprop | grep WM_CLASS"
alias python=python3
alias sourcerc="source ~/.bashrc"
#FUNCTIONS
svim() { sudo vim "$1"; }
ams() { chmod a+x "$1"; mv "$1" "$MYSCRIPTS"; }
kport() {
	for port in "$@"
	do
		pid="$(sudo lsof -t -i:$port)"
		sudo kill -9 $pid &> /dev/null
	done
}
#nice prompt with git branch
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]($(git branch 2>/dev/null | grep "^*" | colrm 1 2))\[\033[00m\]\$ '

#Infinity history size
HISTSIZE=HISTFILESIZE=

# enable bash completion in interactive shells
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

#restore terminal color scheme
wal -R > /dev/null
