curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/.vimrc
vim -E -s -u "~/.vimrc" +PlugInstall +qall
sudo apt install build-essential cmake vim-nox python3-dev
sudo apt install mono-complete golang nodejs default-jdk npm
python3 ~/.vim/plugged/YouCompleteMe/install.py --all
pip install jedi<0.18.0 #Jedi 0.18.0 breaks iPython

