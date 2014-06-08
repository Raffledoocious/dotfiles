###############################################################################
#
# make.sh file which destroys some symlinks 
# 
###############################################################################

### Variables
dir=~/dotfiles
oldir=~/dotfiles_old
files="vimrc"

vimdir=~/.vim
vimoldir=~/vim_old

### Create old_dir for backing up dotfiles
echo "Creating $oldir and $vimolddir for backup of existing files"
mkdir -p $oldir
mkdir -p $vimoldir
echo "...done"

echo "Moving vimrc_orig to vimrc"
cp ./vimrc_orig ./vimrc

for file in $files; do
  echo "Moving $file"
  mv ~/.$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory"
  ln -s $dir/$file ~/.$file
done

### Rename vim directory to old directory
sudo mv $vimdir $oldir
sudo mkdir $vimdir
sudo chown -R $USER $vimdir

### Clone color scheme as vim starts with the next command
git clone https://github.com/Lokaltog/vim-distinguished.git $vimdir/colors/tmp
mv $vimdir/colors/tmp/colors/distinguished.vim $vimdir/colors/distinguished.vim
rm -rf $vimdir/colors/tmp

### Run vundle install
git clone https://github.com/gmarik/Vundle.vim.git $vimdir/bundle/Vundle.vim
vim -c PluginInstall
