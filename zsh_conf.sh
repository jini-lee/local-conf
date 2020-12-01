# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install zshell
brew install zsh

# Install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

# Install font
cp ./font/*.ttf /Library/Fonts/

# Install Oh-my-zsh theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install Prezto sane defaults, aliases, functions, auto completion, and prompt themes.
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

cat <<EOF >> ~/.zshrc 
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
EOF 


# Install ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# Install ripgrep
brew install ripgrep

# Install gpg
brew install gpg

# Install keybase
brew cask install keybase

# Install autosuggestion
# plugins=(git zsh-autosuggestions)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install fasd
brew install fasd

# Install node for coc
curl -sL install-node.now.sh | sh

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# git gutter
mkdir -p ~/.config/nvim/pack/airblade/start
cd ~/.config/nvim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
nvim -u NONE -c "helptags vim-gitgutter/doc" -c q
