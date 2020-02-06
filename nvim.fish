#! /usr/bin/fish

#installer neovim
function install
	if isTermux then
		pkg install neovim
	else
		sudo apt-get install neovim
	end
end

#install iaPlug
function iAPlug
	sudo apt-get install curl
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

#install completer additions
function iAcoc
	#sudo apt-get install build-essential cmake python3-dev
	sudo apt-get install nodejs
	sudo apt-get install npm
		
	#write empty config
	vimconfigfile=$HOME/.config/nvim/init.vim

	#echo "call plug#begin()" >> $vimconfigfile
	#echo "Plug 'Valloric/YouCompleteMe'" >> $vimconfigfile
	#echo "call plug#end()" >> $vimconfigfile

	#install completer
	#python $HOME/.config/nvim/plugged/YouCompleteMe/install.py
end

#install plugin 
function rPlug
	nvim +:PlugInstall +:q! +:q!
end

#config edit
function config
	nvim init.vim
end

#config config to final location
function config-deploy
	rm $HOME/.config/nvim/init.vim
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

#script selector
checkTermux
eval $argv
