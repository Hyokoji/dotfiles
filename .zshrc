#source $HOME/.zsh/.zshrc.common
#load_if_exists(){
#    if[ -e $1 ]; then
    #        source $1
    #    fi
    #}
    #load_if_exists "$HOME/.zshrc.local"

# OS別読み込み
case ${OSTYPE} in
    darwin*)
        #mac
        # パスを追加したい場合
        export PATH="/usr/local/Cellar:$PATH"
        export PATH="$HOME/bin:$PATH"
        export PATH="$HOME/.linuxbrew/bin:$PATH"
        export PATH="$HOME/inst/bin:$PATH"
        export PATH="$HOME/inst/share/cling/Jupyter/kernel:$PATH"
        export PATH="$HOME/.nodebrew/current/bin:$PATH"
        export PATH="$HOME/inst/bin:$PATH"
        export PATH="/usr/local/sbin:$PATH"
        export PATH="/usr/local/opt/llvm/bin:$PATH"
        # エイリアス
        alias ls='ls -G'
        alias chrome='open -a "Google Chrome"'
        alias evernote='vim +"EvervimNotebookList"'
        alias slackgene='vim +"SlaqOpenChannel gene"'
        alias slackgeneral='vim +"SlaqOpenChannel general"'
        alias slackrandom='vim +"SlaqOpenChannel random"'
        #if [ -n "$SSH_CONNECTION" ]; then
            #    export PROMPT='%n@%m $ '
            #else
                #        export PROMPT='$ '
                #fi
                # iTerm2のタブ名を変更する
                function title {
                    echo -ne "\033]0;"$*"\007"
                }
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
        # 補完の設定
        if [ -e /usr/local/share/zsh-completions ]; then
            fpath=(/usr/local/share/zsh-completions $fpath)
        fi
        # コマンドに色を付ける
        if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
            source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        fi
        eval "$(pyenv init -)"
        eval "$(pipenv --completion)"
        eval "$(thefuck --alias)"
        #alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew'
        export PATH="/usr/local/opt/ruby/bin:$PATH"
        ;;
    linux*)
        #linux
        case hostname in
            g*)
                alias ls='ls -v --color=auto'
                alias brew='sudo -iu linuxbrew brew'
                ;;
            h*)
                export PATH="$HOME/bin:$PATH"
                LINUXBREW_PREFIX="/home/linuxbrew/.linuxbrew"
                PATH="${LINUXBREW_PREFIX}/bin:${LINUXBREW_PREFIX}/sbin:${PATH}"
                MANPATH="${LINUXBREW_PREFIX}/share/man:${MANPATH}"

                if [ -f /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
                    source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
                fi
                export PATH="/home/linuxbrew/.linuxbrew/opt/gnu-getopt/bin:$PATH"
                alias ls='ls --color'
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
    linux*)
        case hostname in
            g*)
                PROMPT+="%F{207}<%n@%m>%f "
                ;;
            h*)
                PROMPT+="%F{144}<%n@%m>%f "
                ;;
        esac
        ;;
esac

# gitの状態を表示したい
# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
    local branch_name st branch_status

    if [ ! -e  ".git" ]; then
        # gitで管理されていないディレクトリは何も返さない
        return
    fi
    branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    st=`git status 2> /dev/null`
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
        branch_status="%F{blue}"
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

# 補完
autoload -Uz compinit
compinit

# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
    zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
    zstyle ':completion:*:options' description 'yes'
    zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

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

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

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


# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

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

# 複数ファイルのmv 例　zmv *.txt *.txt.bk
autoload -Uz zmv
alias zmv='noglob zmv -W'

## 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt notify

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける


# -------------------------------------
# パス
# -------------------------------------

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
$HOME/bin(N-/)
/usr/local/bin(N-/)
/usr/local/sbin(N-/)
$path
)

export MANPAGER="/usr/local/bin/vimpager"
alias less=$PAGER
alias zless=$PAGER

#tmuxで現在のブランチ名表示
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'


# 区切り文字の設定
autoload -Uz select-word-style
    select-word-style default
        zstyle ':zle:*' word-chars "_-./;@"
        zstyle ':zle:*' word-style unspecified

        [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#rmしてもすぐには削除しない。いったんゴミ箱に行く。
if type trash-put &> /dev/null
then
    alias rm=trash-put
fi

