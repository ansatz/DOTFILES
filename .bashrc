export GOROOT=/usr/lib/go
export GOPATH=$PATH:$GOROOT/bin

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
##source /usr/local/bin/virtualenvwrapper.sh

[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
export PYTHONPATH=/home/solver/.pythonbrew/pythons/Python-2.6.8/usr/lib/python2.6

export PYTHONPATH=/home/solver/project/scikit-learn-master:$PYTHONPATH
export PYTHONPATH=/home/solver/project/scikit-learn-master/sklearn/ensemble:$PYTHONPATH

export PYTHONPATH=/home/solver/.pythonbrew/pythons/Python-2.6.8/usr/lib/python2.6/scipy:$PYTHONPATH

export PYTHONPATH=/usr/local/lib/python2.7/dist-packages/sklearn:$PYTHONPATH
# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you wfire and ice novelork in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#emacs screwed up when open in terminal with root
#export TERM='xterm-color'
export TERM='xterm-256color'

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
(xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1";;
*);;
esac

# Alias definitions.

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi


export LS_OPTIONS='--color=auto'
eval `dircolors`
alias ls='ls $LS_OPTIONS'

PATH=$PATH:/home/solver/DROID/android-sdk-linux/tools
PATH=$PATH:/home/solver/bin/
PATH=$PATH:/home/solver/git/
PATH=$PATH:/usr/lib/python2.6/
PATH=$PATH:/usr/lib/python2.6/scipy
PATH=$PATH:/home/solver/sandbox/LightTable/LightTable
PATH=$PATH:/home/solver/bin1/conkeror2.sh

export PATH=$HOME/.local/bin:$PATH


#alias
alias sudo='sudo '
alias skip='skippy-xd'
alias o='gnome-open'
alias ..='cd ..'
alias h='history'
alias j='jobs -l'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias cp='cp -i'
alias mvi='mv -iv --backup=t' #no clobber, verbose, number backup
alias gitlog='git log --decorate --pretty=oneline'
alias temp='echo -en "\033]0;sensors\a";watch -d -n 60 sensors'


alias share-mount='sudo mount -t cifs //192.168.0.103/share /home/solver/share -o user=guest'
alias remote='cd ~/web-dev/js-bookmarklet/;python -m SimpleHTTPServer 8888'
alias bee="cd ~/bin1/bmndr/;python bmndr"
alias kumj="cd ~/jobs_work/jobapp/;conkeror http://localhost:8080/ejobs;python APPLIED.py"

alias outside='weather -f fips1704314000 | tac'

#vim-ipython
alias v7='/home/solver/vim/src/vim'
#stty stop undef # to unmap ctrl-s


function cdsort()
{
	cd "$1"; ls -alh -rt
}
alias cdr=cdsort


function acer()
{
	cd /home/solver/Documents/
	vim -e ACERv3-551g-x419-Ubntu13.04.md
}

function crash()
{
	cd /home/solver/crashplan/bin
	./CrashPlanEngine start
	./CrashPlanDesktop
}

function batterypower()
{
	sudo tlp-stat -b
	sudo powertop;
	psensor;
}
alias bat=batterypower
	
function lt() 
{
	ls -ltrsa "$@" | tail; 
}

function psgrep() 
{
	ps axuf | grep -v grep | grep "$@" -i --color=auto; 
}

function fname()
{
	find . -iname "*$@*";
}


export JAVA_HOME=/usr/lib/jvm/java-6-sun


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

COLUMNS=300



alias rmnd='vim ~/.reminders'

if [ -f /home/solver/dev/z-master/z.sh ]; then
. /home/solver/dev/z-master/z.sh	
fi

function hourly()
{
	( python ~/dev1/dashboard/hourly.py )
	#out=`python ~/dev1/dashboard/hourly.py | tac`
	#echo $out
}
alias hrl=hourly
function rlist()
{
	( cd ~/.jaldi; rem -nq | sort )
}

function cal()
{
	remind -mc+$1 ~/.reminders
}

function todo()
{
	cal 1
	rlist
	weather
}


function r100()
{
	vim -p ~/confs-papers-sldes/THESIS/thesis.tex ~/repo1/vim-cmds.txt ~/.reminders ~/vimwiki/index.wiki ~/.jaldi/kum.md ~/.jaldi/backup.txt
}


#
alias cover='vim ~/write1/resume/template/cover_letters_list.md'
alias note='vim ~/repo1/vim-cmds.txt'
alias project='vim ~/.jaldi/.project.txt'
alias backup='vim ~/.jaldi/backup.txt'
alias thesis='vim ~/confs-papers-sldes/full-proposals-thesis.tex'

alias wiki='vim ~/vimwiki/index.wiki'
alias exc='vim ~/.jaldi/.exerciselog'
alias habit='vim ~/.jaldi/.habit'
alias travel='vim ~/.jaldi/.travel'
alias bike='vim ~/.jaldi/.bike'
alias kum='vim ~/.jaldi/kum.md'
alias done='vim ~/.jaldi/.done'

alias name='vim ~/repo1/names.txt'


#--------network----------------------------------------------------
function wlanoffx()
{
	#alias wlanoff='nmcli dev disconnect iface wlan0'
	#ifconfig wlan0 down
	nmcli dev disconnect iface wlan0
	#nmcli nm enable false #sleep=True
	dhclient -x
	echo "sudo ifconfig wlan0 down"
}
# turn on wifi
# list accesspoints SSID of wlan0

alias wlanon='bash /home/solver/util1/wlanscript.sh wlanons '
alias wlanoff='bash /home/solver/util1/wlanscriptoff.sh wlanoffs '

# list names of all connections 
alias wlanname='nmcli -f name,autoconnect con list'



#TITLEBAR--------------------------------------------------------
if [ "$SHELL" = '/bin/bash' ]
then
	case $TERM in
		rxvt|*term)
			set -o functrace
			trap 'echo -ne "\e]0;$BASH_COMMAND\007"' DEBUG
			export PS1="\e]0;$TERM\007$PS1"
		;;
	esac
fi


LBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH 
export LIBRARY_PATH
LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH 
export LD_LIBRARY_PATH

# added by Anaconda 2.1.0 installer
export PATH="/home/solver/anaconda/bin:$PATH"

#issue with password-gorilla
#export PATH="/usr/lib/libitcl3.4.so.1:$PATH"

#DOCKER-----------------------------------------------------------------------
#docker
function drm()
{
	#echo "$1"
	echo 'docker remove and stop'
	docker stop "$1"
	docker rm "$1"
}

function dip()
{
	#get ip
	echo 'docker get ip'
	ip=`docker inspect "$1" | grep "IPAddress"`
	echo $ip
}
alias dps="docker ps"

export PATH="/home/solver/docker.containers/subuser/logic:~/.subuser/bin:$PATH"

function jkl()
{  
	# launch jekyll blog
	cd ~/fig.jekyll.docker 
	echo $(pwd)
	docker run -d -v $(pwd):/data -p 6000:6000 --name jekyll jkblog ruby -S jekyll serve --host=0.0.0.0 --watch --force_polling
	fl=`docker inspect jekyll | grep IPAddress | awk '{print substr($2,2,11)}'`
	fli=http\:\/\/$fl:4000\/
	echo $fli
	#firefox $fli &
}

function project()
{
	#launch docker notebook daemon
	(docker run -d -p 80:8888 -v $(pwd):/notebooks -v ~/private-data/:/notebooks-privatedata/  -e "PASSWORD=pie" --name vpy vim-python:latest)
	#exec to stack
	(docker exec -i -t vpy /bin/bash)
}


# 2 function escape/ctrl caps
function cap() 
{  
	# remap caps to esc or ctrl
	echo 'set CAPS to ESC + CTRL-'
	wd=`pwd`
	xmodmap -e 'keycode 0x42 = Caps_Lock'
	setxkbmap -option ctrl:nocaps; 
	cd $HOME/xcape; 
	./xcape -e 'Control_L=Escape';
	echo $wd
	cd $wd
}

#GIT---------------------------------------------------------------------------
# git alias
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (.*)/(1)/'
}
gitf="\$(parse_git_branch)\$ "
PS1="$PS1$gitf"

