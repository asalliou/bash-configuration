# current-dir-in-iterm-tab-title.sh
# https://gist.github.com/phette23/5270658#
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

#BASH
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] "
export CLICOLOR=1
export LSCOLORS=BxFxBxDxCxegedabagacad

alias ls='ls -GFh'
alias l='ls -al'
alias ..='cd ..'

# # http://davidalger.com/development/bash-completion-on-os-x-with-brew/
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#GIT
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

export PS1=$PS1"\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
if [ -f ~/.bash/git-completion.bash ]; then
 . ~/.bash/git-completion.bash
fi

export PATH="/Applications/SourceTree.app/Contents/Resources":$PATH

#JAVA
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

#Android
export ANDROID_HOME="~/Library/Android/sdk"
export PATH=$ANDROID_HOME"/tools":$PATH
export PATH=$ANDROID_HOME"/build-tools/19.1.0":$PATH
export PATH=$ANDROID_HOME"/platform-tools":$PATH
export PLATFORM_SDK=$ANDROID_HOME"/platforms/android-19"

# Gradle 
source /usr/local/etc/bash_completion.d/gradle

#SVN
export SVN_EDITOR=emacs

#bin
export PATH=~/bin:$PATH

# node
export PATH="$(npm bin):$PATH"
export PATH="$(npm bin -g 2>/dev/null):$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*