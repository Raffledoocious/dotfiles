###############################################################################
#
# make.sh file which destroys some symlinks 
# 
###############################################################################

### Variables
dir=~/dotfiles
oldir=~/dotfiles_old
files="vimrc"

# create old_dir for backing up dotfiles
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
