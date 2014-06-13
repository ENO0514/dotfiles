#--------------------------
## PATH
#--------------------------

# Japanese
export LANG=ja_JP.UTF-8

# manpath
export MANPATH=/usr/local/man:/usr/share/man:/usr/local/share/man:/usr/X11/man:$MANPATH

# zsh for homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# shellscripts
export PATH=~/bin:$PATH

# rvm
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin 

# clang
export PATH=/usr/local/clang-3.0/bin:$PATH

# apache default
export PATH=/usr/sbin/apachectl:$PATH
# apache2.2.3 for homebrew
#export PATH=/usr/local/sbin/apachectl:$PATH
# apache2.4.3 for homebrew
#export PATH=/usr/local/apache2/bin:$PATH

# php53,php54 for homebrew
export PATH="$(brew --prefix josegonzalez/php/php53)/bin:$PATH"
#export PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"

# mysql for homebrew
export PATH=/usr/local/bin/mysql:$PATH

# postgreSQL
#export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# vim
export EDITOR=/usr/local/bin/vim 

# w3m
export BROWSER=w3m

#--------------------------
## 色々な設定
#--------------------------
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=10000

### コアダンプサイズを制限
limit coredumpsize 102400
### 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr
### Emacsライクキーバインド設定
bindkey -e

### 色を使う
setopt prompt_subst
### ビープを鳴らさない
setopt nobeep
### 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs
### 補完候補一覧でファイルの種別をマーク表示
setopt list_types
### サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume
### 補完候補を一覧表示
setopt auto_list
### 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
### cd 時に自動で push
setopt auto_pushd
### 同じディレクトリを pushd しない
setopt pushd_ignore_dups
### ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob
### TAB で順に補完候補を切り替える
setopt auto_menu
### zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history
### =command を command のパス名に展開する
setopt equals
### --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
### ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify
### ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
### 出力時8ビットを通す
setopt print_eight_bit
### ヒストリを共有
setopt share_history
### ディレクトリ名だけで cd
setopt auto_cd
### カッコの対応などを自動的に補完
setopt auto_param_keys
### ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
### スペルチェック
setopt correct
### {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
### Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control
### コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space
### コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
### ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
### history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
### 補完候補を詰めて表示
setopt list_packed
### 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash
### オブジェクトファイルとか中間ファイルとかはfileとして補完させない
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

### 補完機能の強化
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=2

## 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

## マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

### セパレータの設定(オプションに対応)
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

### プロンプト設定
autoload colors
colors
PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

# z
_Z_CMD=j
source ~/.zsh/git/z/z.sh
precmd() {
	  _z --add "$(pwd -P)"
}

# auto-fu.zsh
source ~/.zsh/git/auto-fu.zsh/auto-fu.zsh
if [ -d "$HOME/.zsh" ]; then
		if [ -d "$HOME/.zsh/git/auto-fu.zsh" ]; then
				source "$HOME/.zsh/git/auto-fu.zsh/auto-fu.zsh"
				function zle-line-init ()
			    {
						auto-fu-init
				}
				zle -N zle-line-init
				zstyle ':completion:*' completer _oldlist _complete
		fi
fi

# コマンドラインスタック (esc-q、esc-h）
show_buffer_stack() {
	  POSTDISPLAY="
	  stack: $LBUFFER"
	    zle push-line-or-edit
	}
zle -N show_buffer_stack

#---------------------
## alias
#---------------------
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -alG'
alias rm='rm -i'
alias df='df -h'
alias tar='tar zxvf'
alias bye='sudo shutdown -h now'
alias peep='~/peep/peep'

# LAMP
alias edit_host="sudo vim /etc/hosts"
alias edit_php='vim /usr/local/etc/php/5.3/php.ini'
#alias edit_php='vim /usr/local/etc/php/5.4/php.ini'
alias edit_mysql='vim /usr/local/etc/my.cnf'

# httpd default
alias edit_httpd="sudo vim /etc/apache2/httpd.conf"
alias edit_vhttpd="sudo vim /private/etc/apache2/extra/httpd-vhosts.conf"
# httpd apache2.2.3 for homebrew
#alias edithttpd='vim /usr/local/Cellar/httpd/2.2.23/etc/apache2/httpd.conf'
# httpd apache2.4.3 for homebrew
#alias edithttpd='vim /usr/local/apache2/conf/httpd.conf'

# start,stop,refstart apache default
alias start_apache="sudo /usr/sbin/apachectl start"
alias stop_apache="sudo /usr/sbin/apachectl stop"
alias restart_apache="sudo /usr/sbin/apachectl restart"
# java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

# 隠しファイルを表示・隠す
alias showfiles='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
alias hiddenfiles='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'
# System Preferense
alias sp='open -a "system preferences"'
# Console
alias console='open -a console' 
# Safari
alias safari='open -g -a safari' 
# FireFox
alias firefox="open -a Firefox"
# CotEditor
alias cot='open -g -a CotEditor'  
# SublimeText2
alias st="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

# macvim
alias mvi="/Applications/MacVim.app/Contents/MacOS/mvim"
alias mvim="/Applications/MacVim.app/Contents/MacOS/mvim"

# emacs
alias emacs_nw='open -a Emacs'
alias emacs='/usr/local/Cellar/emacs/24.2/bin/emacs -nw'
alias emacs_tm='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias emacs_daemon='/Applications/Emacs.app/Contents/MacOS/Emacs --daemon'
alias emacs_client='emacsclient -t'
alias emacs_kill="emacsclient -e '(kill-emacs)'"

# git
alias gst='git status'
alias gci='git commit'
alias gdi='git diff'
alias gad='git add'
alias glb='git log --graph --branches --pretty=format:"%d [%h] \"%s\""'
