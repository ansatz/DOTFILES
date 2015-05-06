##create symlink of files on desktop
#-----------------------------------

# MV ANY EXISTING ~/ .DOTFILES FROM HOME TO 
bakdir=$HOME'/dotfiles.bak/'


#list of .dotfiles in dir
dots=`find . -maxdepth 1 -type f | cut -d"/" -f2 | grep '^[\.].*$'`
echo -e "\033[1m$dots\033[0m"
tput sgr0

dt="a dog"
#mv dotfiles to dotfiles.bak
for d in $dots; do
	di=$HOME'/'$d

	# OLD LINKS if file has open can still access until closes
	u='UNLINKING '$di
	echo -e '\E[47;35m'"\033[1m$u\033[0m"
	tput sgr0
	unlink $di

	# OLD DOTFILES
	#dff=`diff -q $d $HOME'/'$d`
	#echo -e '\E[47;35m'"\033[1m$dff\033[0m"
	#df=$bakdir$d
	#mv -iv --backup=t $di $df
	
	# UPDATES
	ln -sv $(pwd)/$d $HOME/$d
	l='LINKING '$d
	echo -e '\E[47;35m'"\033[1m$l\033[0m""\n"
	tput sgr0
done




