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
oldir=~/vim_old

### Create old_dir for backing up dotfiles
echo "Creating $oldir for backup of existing dotfiles"
mkdir -p $oldir
echo "...done"

echo "Moving any existing dotfiles to dotfiles_old"
cd $dir

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


