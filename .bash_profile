export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/texinfo/bin:$PATH"
export WEB_URL='http://www.coursera.org'
export EDITOR=/usr/bin/vim

alias calculator="bc -l"

# Aliases for VLC and rtv
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias rtv="rtv --enable-media"

# Aliases for pip2 and pip3
alias pip2="/usr/local/bin/pip2.7"
alias pip3="/usr/local/bin/pip3.6"

# Aliases for ls
alias ls="ls -F -G"

eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH=/usr/local/mysql/bin:$PATH

# Setting path for the LLVM tools
alias clang++="/usr/local/opt/llvm/bin/clang++"

# Alias for SQL
alias sql="/usr/local/mysql/support-files/mysql.server"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

alias python='python3'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH=$PATH:/Users/smu/bin

source '/Users/smu/lib/azure-cli/az.completion'

# Till such time as VimR remains out of favour
# Make VimR accessible from the terminal when you type vim or vi
alias vim='/usr/bin/vim'
alias vi='/usr/bin/vim'

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PATH="/usr/local/opt/llvm/bin:$PATH"	#get clang in PATH

export PATH="$HOME/.cargo/bin:$PATH"


# added Java to path
export JAVA_HOME=$(/usr/libexec/java_home)

# added by Anaconda3 5.1.0 installer
export PATH="/Users/smu/anaconda3/bin:$PATH"

#function _update_ps1() {
#    PS1="$(~/go/bin/powerline-go -error $?)"
#}

#if [ "$TERM" != "linux" ]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /Users/smu/anaconda3/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
