#installer neovim
function install
		sudo apt-get install neovim
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
function isTermux
		if command -v termux-setup-storage  
				then  
				echo "running in termux like a boss"  
		end
end

#script selector
eval $argv
