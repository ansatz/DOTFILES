export GOROOT=/usr/lib/go
export GOPATH=$PATH:$GOROOT/bin
#export perl
#export PERL5LIB=~/lib/perl5/site_perl


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
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

export LS_OPTIONS='--color=auto'
eval `dircolors`
alias ls='ls $LS_OPTIONS'

PATH=$PATH:/home/solver/DROID/android-sdk-linux/tools
# PATH=$PATH:/home/solver/Desktop/sandbox/stride_
# PATH=$PATH:/home/solver/Desktop/sandbox/dssp
# PATH=$PATH:/home/solver/Desktop/sandbox/oodiff
# PATH=$PATH:/home/solver/Desktop/sandbox/git-oodiff
PATH=$PATH:/home/solver/bin/
PATH=$PATH:/home/solver/git/
PATH=$PATH:/usr/lib/python2.6/
PATH=$PATH:/usr/lib/python2.6/scipy
PATH=$PATH:/home/solver/sandbox/LightTable/LightTable
PATH=$PATH:/home/solver/bin1/conkeror2.sh
#PATH=$PATH:/home/solver/util1/wlanscript.sh

export PATH=$HOME/.local/bin:$PATH

##BROWSER = $PATH:/usr/local/bin/dillo

# vim mapping of ESC to CAPS
#xmodmap ESC_CAPS
#if [ "$PS1" ]; then
#	xmodmap ~/.Xmodmap
#fi

#alias
#alias sudo='sudo ' #adding space allows chain alias expansion
#alias emacs='emacs -nw'
alias bee="cd ~/bin1/bmndr/;python bmndr"
alias kumj="cd ~/jobs_work/jobapp/;conkeror http://localhost:8080/ejobs;python APPLIED.py"
alias skip='skippy-xd'
alias o='gnome-open'
alias ..='cd ..'
alias h='history'
alias j='jobs -l'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias cp='cp -i'
alias mv='mv -i'
alias gitlog='git log --decorate --pretty=oneline'
alias share-mount='sudo mount -t cifs //192.168.0.103/share /home/solver/share -o user=guest'

alias remote='cd ~/web-dev/js-bookmarklet/;python -m SimpleHTTPServer 8888'

alias temp='echo -en "\033]0;sensors\a";watch -d -n 60 sensors'

alias outside='weather -f fips1704314000 | tac'


#vim-ipython
#ipython 0.13.2
#python 2.7.4
#vim 7.4
alias v7='/home/solver/vim/src/vim'
stty stop undef # to unmap ctrl-s
#workflow
#ipython console
#v7 
#:IPython
#c-s copy line/block, f5 load file, \s vim-ipython shell

wws()
{
	firefox -P 'system' --no-remote
}
wwr()
{
	firefox -P 'research' --no-remote
}

wwd()
{
	firefox -P 'daily-read' --no-remote
}

fox()
{
	firefox -P 'def2' --no-remote
}

cdbook()
{
	cd ~/BOOKS; ls -lrt
}
cdbooks()
{
	book
	cd ~/.aMule/Incoming
	gnome-terminal --window-with-profile=Incoming -e "sh -c 'cd ~/.aMule/Incoming; ls -lrt'" 
	#gnome-terminal -x cd ~/.aMule/Incoming; ls -lrt
}

pass()
{
	cd ~/pw; ./tclkit-linux-x86 gorilla-1.4.kit
}

cdr()
{
	cd "$1"; ls -alh -rt
}


ooo()
{
	gnome-open "$1"
	gnome-open "$2"
	gnome-open "$3"
}

function tennis()
{
	cd /home/solver/tennis/
	vim -e tennis.md
}

function b1()
{
	cmus 
	cmus-remote -P /home/solver/Music2/Brian\ Eno/Neroli.mp4 
}

function b2()
{
	#guru: quotes,outlook,history,zen
	#personalInformatics: splits,handstands,mile-run-time,tennis
	#tennis
	#music
	#brainworkshop
	#email-daily-read
	cd /home/solver/bin1/brain/brainworkshop
	python brainworkshop.pyw
}

function kurt()
{
	cd /home/solver/write1/
	vim -e general_express.md
}
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
function bat()
{
	sudo tlp-stat -b
	sudo powertop;
	psensor;
}
	
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

	
#export WORKON_HOME=/home/solver/lib/pyvirtualenv
#source /usr/local/bin/virtualenvwrapper.sh

export JAVA_HOME=/usr/lib/jvm/java-6-sun


#os()
#{
##!/bin/bash
#while (("$#")); do
##while[ $1 gt 1 ]; do
#	if [ ! -e "$1" ]; then	#does file exist?
#		#echo "$1 bad";
#		echo continue
#	fi
#	"$(gnome-open "$1")"; #()subshell list
#	shift;
#	echo "$1"
#	sleep 1
#done
#
#}
#

#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

COLUMNS=300

#function parse_git_branch {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return echo "["${ref#refs/heads/}"]"
#}
##PS1="\w\$(parse_git_branch)\$ "


#track your directory usage
#export JPY=/home/solver/dev/j2-master/j.py # tells j.sh where the python script is
#. /home/solver/dev/j2-master/j.sh          # provides the j() function



#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

if [ -f /home/solver/dev/z-master/z.sh ]; then
. /home/solver/dev/z-master/z.sh	
fi

# . /home/solver/dev/now.sh-master/now.sh
#function now()
#{
#d -t 1 <&1
#timeout=$?
#
#
# loop forever
#
#while true
#	do
#	#
#	# relay stdin to stdout		#
#       while true
#		do
#			IFS= read -r -t 1 line; rc=$?
#		               if [ $rc != 0 ]; then break; fi
#						echo "$line"
#	   done
#	#
#	# exit status is greater than 128 if the timeout is exceeded
#	#
#	if [ $rc != $timeout ]; then break; fi
#
#    #
#	# print the timestamp
#	#
#    now=`date ${1:++"$1"}`
#    echo -ne "$now\r" >&2
#    done
#}

#source ~/dev/liquidprompt-master/liquidprompt

#remind
#remind -p | rem2ps > remind.ps
#remind -p | rem2html > remind.html
#remind -n | sort
alias rmnd='vim ~/.reminders'
function hrl()
{
	( python ~/dev1/dashboard/hourly.py )
}
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

#WORK<thesis,n,r,todo,kum>
#read the docs, got tabs to work
#range,verb,noun
#function work()
#{
#	vim -p "~/confs-papers-sldes/THESIS/thesis.tex" +"tabnew ~/repo1/vim-cmds.txt" +"tabnew ~/.reminders" +"tabnew ~/vimwiki/index.wiki" +"tabnew ~/.jaldi/kum.md" +"tabnew ~/.jaldi/backup.txt"
#}

function r100()
{
	vim -p ~/confs-papers-sldes/THESIS/thesis.tex ~/repo1/vim-cmds.txt ~/.reminders ~/vimwiki/index.wiki ~/.jaldi/kum.md ~/.jaldi/backup.txt
}


#function theList()
#{
#	#global
#	declare -a str 
#	
#	#array set with ( )
#	listL=(~/dev1/bash-scripts/pycooProjects/launcher.py ~/dev1/quantumCircuitGrover/grover.py ~/dev1/bash-scripts/pycooProjects/launcher.py ~/dev1/3d_print_file/3d.py ~/dev1/cancerGameTheory/strat.py ~/dev1/quaternion/quatr.py ~/dev1/pyknonfun/strat.py ~/READING/reading_docs/eloquentJavaScript/index.py)
#	#xterm -e "echo "file list number: ${#listL[*]}";bash"
#	echo "file list number: ${#listL[*]}"
#	#for loop
#	for fl in "${listL[@]}"
#	do
#		echo $fl
#	done
#}


#function stench()
#{
#	#global
#	declare -a str 
#	
#	#array set with ( )
#	listL=(~/dev1/bash-scripts/pycooProjects/launcher.py ~/dev1/quantumCircuitGrover/grover.py ~/dev1/3d_print_file/3d.py ~/dev1/cancerGameTheory/strat.py ~/dev1/quaternion/quatr.py ~/dev1/pyknonfun/strat.py ~/READING/reading_docs/eloquentJavaScript/index.py)
#	#xterm -e "echo "file list number: ${#listL[*]}";bash"
#	echo "file list number: ${#listL[*]}"
#	#for loop
#	for fl in "${listL[@]}"
#	do
#		echo $fl
#		str=$str' '$fl
#		#echo $str
#	done	
#	# (blah )indicate parallel subshell
#	vim -p $str ;
#	firefox www.duolingo.com ;
#}



alias n='vim ~/repo1/vim-cmds.txt'
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

# use alias expansion (whitespace) 

alias sudo='sudo '

# turn off wifi
#function wlanoff()
#{
#	#alias wlanoff='nmcli dev disconnect iface wlan0'
#	nmcli dev disconnect iface wlan0
#	ifconfig wlan0 down
#	dhclient -x
#}

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

#------------------------------------------------------------------


#SET TITLE BAR
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

# enable bash completion in interactive shells
#if [ -f /etc/bash_completion ]; then
#	. /etc/bash_completion
#fi

# added by Anaconda 2.1.0 installer
export PATH="/home/solver/anaconda/bin:$PATH"


# docker
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

# git alias
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (.*)/(1)/'
}

#export PS1="[33[00m]u@h[33[01;34m] W [33[31m]$(parse_git_branch) [33[00m]$[33[00m] "
#PS1="[33[00m]u@h[33[01;34m] W $(parse_git_branch)\$ "
#PS1="[33[00m]u@h[33[01;34m]\w\$(parse_git_branch)\$ "
gitf="\$(parse_git_branch)\$ "
PS1="$PS1$gitf"

