#! /usr/bin/fish

#installer neovim
function install
	pkgInstall neovim
end

#install iaPlug
function iAPlug
	pkgInstall curl
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

function iPySupport
	pkgInstall python3 
	pkgInstall python3-pip

	pip install flake8 #linter
	pip install pynvim #?not sure but neded in many cases
	pip install black #format fixer
	pip install jedi #syntax highlighting
end


#install completer additions
function iAcoc
	#sudo apt-get install build-essential cmake python3-dev
	pkgInstall nodejs
	pkgInstall npm
		
	#write empty config
	set vimconfigfile $HOME/.config/nvim/init.vim

	#echo "call plug#begin()" >> $vimconfigfile
	#echo "Plug 'Valloric/YouCompleteMe'" >> $vimconfigfile
	#echo "call plug#end()" >> $vimconfigfile

	#install completer
	#python $HOME/.config/nvim/plugged/YouCompleteMe/install.py
end

#install plugin 
function rPlug
	nvim +:PlugClean +:PlugInstall +:q! +:q!
end

#config edit
function config
	nvim init.vim
end

#config config to final location
function config-deploy
	if [ -f $HOME/.config/nvim/init.vim ]
		rm $HOME/.config/nvim/init.vim
	end
	cp init.vim $HOME/.config/nvim/init.vim
end


#termux function check
set onTermux 0

function checkTermux
	if [ (count (string match -e "com.termux" $PATH)) != 0 ]
		set onTermux 1
	end
end

#testing termux
function testTermux
	if [ $onTermux = 1 ] 
		echo "inTermux"
	else
		echo "notOnTermux"
	end
end

#install package
function pkgInstall
	if [ $onTermux = 1 ] 
		pkg install $argv[1]
	else
		sudo apt-get install $argv[1]
	end
end

#script selector 
checkTermux

#no option menu
if count $argv > /dev/null
	eval $argv
else
	echo \tinstall - install neovim
	echo \tiAPlug - install Plug [curl]
	echo \tiAcoc	- install coc [node,npm]
 	echo \trPlug - refresh plugins 
 	echo \tconfig - edit config
 	echo \tconfig-deploy - deploy config locally
	echo 
	testTermux
end
