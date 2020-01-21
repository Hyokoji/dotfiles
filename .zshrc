# OS別パスとエイリアスの読み込み
case ${OSTYPE} in
    darwin*)
        export PATH="/usr/local/Cellar:$PATH"
        export PATH="$HOME/bin:$PATH"
        export PATH="$HOME/dotfiles/bin:$PATH"
        export PATH="$HOME/.linuxbrew/bin:$PATH"
        export PATH="$HOME/inst/bin:$PATH"
        export PATH="$HOME/inst/share/cling/Jupyter/kernel:$PATH"
        export PATH="$HOME/.nodebrew/current/bin:$PATH"
        export PATH="/usr/local/bin:$PATH"
        export PATH="/usr/local/sbin:$PATH"
        export PATH="/usr/local/Cellar:$PATH"
        export PATH="/usr/local/opt/llvm/bin:$PATH"
        export PATH="/usr/local/opt/ruby/bin:$PATH"
        export PATH="/usr/local/opt/curl/bin:$PATH"
        export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"
        export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
        export PATH="/usr/local/opt/libxml2/bin:$PATH"
        export PATH="/usr/local/opt/nss/bin:$PATH"
        export PATH="/usr/local/opt/qt/bin:$PATH"
        export PATH="$PATH:$HOME/miniconda3/bin"
        export BIBINPUTS=$BIBINPUTS:/usr/local/texlive/2019/texmf-dist/bibtex/bib
        export BSTINPUTS=$BSTINPUTS:/usr/local/texlive/2019/texmf-dist/bibtex/bst
        # エイリアス
        alias ls='lsd'
        alias chrome='open -a "Google Chrome"'
        ;;
    linux*)
        export HOSTNAME=`hostname`
        case ${HOSTNAME} in
            g*)
                export PATH="$HOME/bin:$PATH"
                export PATH="$PATH:$HOME/miniconda3/bin"
                LINUXBREW_PREFIX="/home/linuxbrew/.linuxbrew"
                PATH="${LINUXBREW_PREFIX}/bin:${LINUXBREW_PREFIX}/sbin:${PATH}"
                MANPATH="${LINUXBREW_PREFIX}/share/man:${MANPATH}"
                alias ls='lsd'
                alias brew='sudo -iu linuxbrew brew'
                ;;
            h*)
                export PATH="$HOME/bin:$PATH"
                export PATH="$HOME/dotfiles/bin:$PATH"
                export PATH="$PATH:$HOME/miniconda3/bin"
                LINUXBREW_PREFIX="/home/linuxbrew/.linuxbrew"
                PATH="${LINUXBREW_PREFIX}/bin:${LINUXBREW_PREFIX}/sbin:${PATH}"
                MANPATH="${LINUXBREW_PREFIX}/share/man:${MANPATH}"
                export PATH="/home/linuxbrew/.linuxbrew/opt/gnu-getopt/bin:$PATH"
                export PATH="/home/linuxbrew/.linuxbrew/opt/sphinx-doc/bin:$PATH"
                export BIBINPUTS=$BIBINPUTS:/usr/share/texlive/texmf-dist/bibtex/bib
                export BSTINPUTS=$BSTINPUTS:/usr/share/texlive/texmf-dist/bibtex/bst
                alias ls='lsd'
                ;;
        esac
        ;;
esac

# ------------------------------------
# プロンプト
# -------------------------------------
OK="^_^*"
NG="~_~;"
PROMPT=""
PROMPT+="%(?.%F{green}$OK%f.%F{red}$NG%f) "
PROMPT+=""
case ${OSTYPE} in
    darwin*)
        PROMPT+="%F{cyan}<%n@%m>%f "
        ;;
    freebsd*)
        PROMPT+="%F{194}<%n@%m>%f "
        ;;
    linux*)
        case ${HOSTNAME} in
            g*)
                PROMPT+="%F{207}<%n@%m>%f "
                ;;
            h*)
                PROMPT+="%F{144}<%n@%m>%f "
        esac
        ;;
esac

# gitの状態を表示したい
# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
    local branch_name st branch_status

    branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    st=`git status 2> /dev/null`
    #    if [ $? -gt 0 ]; then
    #        # git status が働かないディレクトリでは何も返さない
    #        return
    #    fi
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        # 全てcommitされてクリーンな状態
        branch_status="%F{green}"
    elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
        # gitに管理されていないファイルがある状態
        branch_status="%F{red}?"
    elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
        # git addされていないファイルがある状態
        branch_status="%F{red}+"
    elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
        # git commitされていないファイルがある状態
        branch_status="%F{yellow}!"
    elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
        # コンフリクトが起こった状態
        echo "%F{red}!(no branch)"
        return
    else
        # 上記以外の状態の場合は青色で表示させる
        return
        #        branch_status="%F{blue}"
    fi
    # ブランチ名を色付きで表示する
    echo "${branch_status}[$branch_name]"
}
# プロンプトの右側に現在のパスを表示
RPROMPT="%F{blue}[%d]%{${reset_color}%}"
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT+='`rprompt-git-current-branch`'

#日本語を使用
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"

#escを速く
KEYTIMEOUT=1

# 色を使用
autoload -Uz colors
colors
zstyle ":completion:*" matcher-list                                        \
    ""                                                                  \
    '                                     m:{[:lower:]\-}={[:upper:]_}' \
    'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{[:lower:]\-}={[:upper:]_}' \
    'r:|?=**                              m:{[:lower:]\-}={[:upper:]_}'


#補完
autoload -Uz compinit
compinit

#viキーバインド
#bindkey -v
set -o vi

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups


# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'


# エイリアス
alias so='source'
alias v='vim'
alias vi='vim'
alias vz='vim'
alias c='cdr'

# historyに日付を表示
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'

# backspace,deleteキーを使えるように
stty erase 
bindkey "^[[3~" delete-char


# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control


# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# コマンドを途中まで入力後、historyから絞り込み
# 例 ls まで打ってCtrl+pでlsコマンドをさかのぼる、Ctrl+bで逆順
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
# cdrコマンドで履歴にないディレクトリにも移動可能に
zstyle ":chpwd:*" recent-dirs-default true

## 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt notify

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける


#w3mの設定
function google() {
    local str opt
    if [ $# != 0 ]; then
        for i in $*; do
            str="$str+$i"
        done
        str=`echo $str | sed 's/^\+//'`
        opt='search?num=50&hl=ja&lr=lang_ja'
        opt="${opt}&q=${str}"
    fi
    w3m http://www.google.co.jp/$opt
}

bindkey -M viins '^P' history-beginning-search-backward-end
bindkey -M viins '^N' history-beginning-search-forward-end

# 区切り文字の設定
autoload -Uz select-word-style
select-word-style default
    zstyle ':zle:*' word-chars "_-./;@"
    zstyle ':zle:*' word-style unspecified

#rmしてもすぐには削除しない。いったんゴミ箱に行く。
if type trash-put &> /dev/null
then
    alias rm=trash-put
fi

if [ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ]; then
    zcompile ~/.zshrc
fi

#重複したパスの削除
typeset -U path cdpath fpath manpath PATH

#プラグイン管理
: ${ZSHRC_ROOT:="${HOME}/.zsh"}
: ${ZSHRC_PLUGDIR:="${ZSHRC_ROOT}/plugins"}

zsh_plugin() {
    local repo
    local uri
    local repopath

    repo=$1
    uri="https://github.com/${repo}.git"
    repopath="${ZSHRC_PLUGDIR}/${repo}"
    plugname=${repo:t}

    if [ ! -d ${repopath} ]; then
        git clone -q ${uri} ${repopath}
    fi
    source "${repopath}/${plugname}.zsh"
}

zsh_plugin 'zsh-users/zsh-syntax-highlighting'
