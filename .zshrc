sleepy-merge(){
  git co scheduled
  git pull origin scheduled
  git merge playspan_bob
  git push origin scheduled
  git co staging
  git pull origin staging
  git merge scheduled
  git push origin staging
  git co playspan_bob
}

sleepy_track(){
  git branch --track scheduled origin/scheduled
  git branch --track staging origin/staging
  git branch --track hotfix origin/hotfix
}

git_prompt(){
	git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3
	echo $ref
}

bobgit(){
echo 'gitcomet - status, add, commit'
echo 'gitmerp - status, pull master, merge asdf, push master'
echo
}

macom(){
git add -A
git commit -m $1
git push origin master
}

goku(){
git add .
git commit -m $1
git push heroku master
}


rebpro(){
git co production
git rebase master
git push origin production
git co master
}


alias herogit="git commit -ae; git push heroku"
alias gitcomet="git status; git add .; git commit -e; git status;"
alias gitmerp="git status; git pull github master; git merge asdf; git push github master; git status;"
alias gitawesome="git pull github master; git rebase master"
alias pete="git status; git add .; git commit -ae; git push github master;git status"
alias pote="git status; git add .; git commit -ae; git push origin master;git status"
alias ss="script/server -u"
alias rs="rails server -u"
alias sc="script/console"
alias rc="rails console"
alias macrubya="/usr/local/bin/macirb"
alias csd="cap staging deploy"
alias cpd='cap production deploy'
alias gph="git add .; git commit -ae; git push heroku"
alias gpom="git push origin master"
alias gpo="git push origin"
alias be='bundle exec'


alias slice="ssh bob@174.143.175.89 -p46559"
alias ...=" ../.."
alias ....=" ../../.."
alias .....=" ../../../.."
alias ......=" ../../../../.."

alias ll="ls -alh"
alias gh="github"
alias rake="noglob rake"

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
EDITOR="emacs"
GEM_OPEN_EDITOR="emacs"
R_HOME='/Library/Frameworks/R.framework/Resources/'
NODE_PATH='/usr/local/lib/node_modules'

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

setopt AUTO_CD

export HISTSIZE SAVEHIST EDITOR HISTFILE GEM_OPEN_EDITOR R_HOME NODE_PATH

if [[ -f "$HOME/.amazon_keys" ]]; then
    source "$HOME/.amazon_keys";
fi


path=( /usr/local/bin /usr/local/lib $path /opt/local/bin /Users/larrick/bin)

# supposed to send meta key , possibly not needed?
[[ $TERM = "xterm" ]] && stty pass8 && bindkey -me

# i think this is to refresh the working directory on dir change
# and put it in the title bar
  chpwd() {
    [[ -t 1 ]] || return
    case $TERM in
      sun-cmd) print -Pn "\e]l%~\e\\"
        ;;
      *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
        ;;
    esac
  }

# get the name of the branch we are on

setopt prompt_subst
PROMPT='%~@$(git_prompt)>'


[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
