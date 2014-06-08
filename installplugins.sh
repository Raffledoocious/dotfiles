###############################################################################
#
# make.sh file which destroys some symlinks 
# 
###############################################################################

### Variables
vimdir=~/.vim

### compile YouCompleteMe
sudo apt-get install build-essential cmake
cd $vimdir/bundle/YouCompleteMe
./install.sh --clang-completer

### Run npm install for tern
cd $vimdir/bundle/tern_for_vim
sudo npm install
