#!/bin/bash

echo "installing homebrew..."
if [ "$(uname)" == 'Darwin' ]; then
    OS='Mac'
    which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    OS='Linux'
    which brew >/dev/null 2>&1 || sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
    echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    OS='Cygwin'
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi
echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
    git
    wget
    curl
    tree
    openssl
    colordiff
    zsh-completions
    cask
    ansible
    peco
    hub
    tig
    node
    lua
    vim
    mysql
    postgresql
    sqlite
    "php55 --homebrew-apxs"
    httpd22
    ricty
    sqlite
    composer
    markdown
    ctags
    ssh-copy-id
    phantomjs
    mecab
    diff-so-fancy
    thefuck
    mpv
    llvm
    neovim
    pyenv
    translate-shell
    zsh
    gcc
    fontforge
)

"brew tap..."
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap homebrew/apache
brew tap sanemat/font

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

if [ "$(uname)" == 'Darwin' ]; then
    OS='Mac'
    casks=(
        dropbox
        evernote
        slack
        iterm2
        virtualbox
        1password
    )

    echo "start brew cask install apps..."
    for cask in "${casks[@]}"; do
        brew cask install $cask
    done

    brew cask cleanup
fi

brew cleanup

cat << END

                                                                                                                                                                                                        **************************************************
                                                                                                                                                                                                        HOMEBREW INSTALLED! bye.
                                                                                                                                                                                                        **************************************************

                                                                                                                                                                                                    END
