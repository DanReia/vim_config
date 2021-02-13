curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/.vimrc
sudo apt-get update
sudo apt-get install nodejs
vim -E -s -u "~/.vimrc" +PlugInstall +qall
echo "Installing COC language servers"
vim -e -c "CocInstall coc-json coc-tsserver coc-python coc-rls"

