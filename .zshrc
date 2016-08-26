# Path to your oh-my-zsh installation.
export ZSH=/Users/tozhou/.oh-my-zsh
export GOPATH=/Users/tozhou/work/linkedin/chitu/go
export GOPATH=$GOPATH:/Users/tozhou/work/mygo
export PATH=$PATH:$GOPATH/bin/
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump textmate osx)

# User configuration

export PATH=/usr/local/go/bin:/usr/local/Cellar/emacs/24.5/bin:/Users/tozhou/.rvm/gems/ruby-2.2.1/bin:/Users/tozhou/.rvm/gems/ruby-2.2.1@global/bin:/Users/tozhou/.rvm/rubies/ruby-2.2.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/linkedin/bin:/opt/X11/bin:/Users/tozhou/.rvm/bin:/Users/tozhou/work/linkedin/chitu/go/bin:/Users/tozhou/Library/Android/sdk/platform-tools/:/Users/tozhou/Library/Android/sdk/tools/:/usr/local/Cellar/wireshark/2.0.1_1/bin/
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias c='cd'
alias b='cd ..'
alias e="emacs"
alias g='git'
alias ip='ifconfig|grep inet'
alias l='ls -alsg'
alias md='mkdir'
alias py="python"
alias te="tee /dev/tty"
alias ghd='g log --color=never | head -n 1|cut -d " " -f 2|te|clc'
clipbordtmp='/tmp/.clipbordtmp_zt'
# clp past from clipboard
alias clp="clippaste"
#clc copy to clipboard
clc (){
    if [ -t 0 ]; then
        echo $1>$clipbordtmp
    else
        while read -r line ; do
            echo $line>>$clipbordtmp
        done
    fi
    clipcopy $clipbordtmp
    rm -rf $clipbordtmp
}

pc (){
    echo $1
    python -c "print ($1)"
}

gofun(){
    grep -r -n 'func [A-Z]' $1
}

alias staging="ssh -i /Users/tozhou/.ssh/staging-jump-tozhou tozhou@119.254.210.50 -p2929"
alias prod="ssh -i ~/.ssh/production-jump-tozhou -p2929 tozhou@119.254.210.223"

alias gr="go run"
alias gt="go test -v"

JUSER="jenkins"
JPWD="*PsY12damOJ"


jlogin() {
    curl -i 'http://build.chitu.cn:8090/j_acegi_security_check' -H 'Pragma: no-cache' -H 'Origin: http://build.chitu.cn:8090' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.8,en;q=0.6,zh-TW;q=0.4' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Referer: http://build.chitu.cn:8090/login' -H 'Cookie: JSESSIONID.99388ba9=1o7dempvyo4nx2vtox6vyulg; JSESSIONID.2dfc57e0=1htezxhg1gd3q1ifjqx3e1s637; ACEGI_SECURITY_HASHED_REMEMBER_ME_COOKIE="amVua2luczoxNDcwNjU0NDgzNjE3OjM1ZDA5MDlhOGRhMTNmNjQzOTIxNDQ3ZGMwMzE3MzgwYzIwM2E5ZDZkZGNjNTEwMjEzNjYzMThiMjE2OWFiMDY="; screenResolution=1920x1200' -H 'Connection: keep-alive' --data 'j_username=jenkins&j_password=*PsY12damOJ&remember_me=on&from=&json=%7B%22j_username%22%3A+%22jenkins%22%2C+%22j_password%22%3A+%22*PsY12damOJ%22%2C+%22remember_me%22%3A+true%2C+%22from%22%3A+%22%22%7D&Submit=%E7%99%BB%E5%BD%95' --compressed | grep Cookie|tail -n 1|cut -c55-170
}

jstaging() {
    cookie = jlogin()
    echo $cookie
    curl 'http://build.chitu.cn:8090/job/chitu/build?delay=0sec' -H 'Pragma: no-cache' -H 'Origin: http://build.chitu.cn:8090' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.8,en;q=0.6,zh-TW;q=0.4' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Referer: http://build.chitu.cn:8090/job/chitu/build?delay=0sec' -H 'Cookie: JSESSIONID.99388ba9=1o7dempvyo4nx2vtox6vyulg; JSESSIONID.2dfc57e0=1htezxhg1gd3q1ifjqx3e1s637; ACEGI_SECURITY_HASHED_REMEMBER_ME_COOKIE="amVua2luczoxNDcwNjU0NDgzNjE3OjM1ZDA5MDlhOGRhMTNmNjQzOTIxNDQ3ZGMwMzE3MzgwYzIwM2E5ZDZkZGNjNTEwMjEzNjYzMThiMjE2OWFiMDY="; screenResolution=1920x1200' -H 'Connection: keep-alive' --data 'name=TAG&value=$1&name=CHITU_SHARE_TAG&value=&name=TARGET&value=APP&name=ENV&value=STAGING&name=EXPERIMENT&value=on&name=RELEASE&name=GO_VERSION&value=go1.7rc1&statusCode=303&redirectTo=.&json=%7B%22parameter%22%3A+%5B%7B%22name%22%3A+%22TAG%22%2C+%22value%22%3A+%224881778c318b9d3afbd654cbcdf761a0c0d25814%22%7D%2C+%7B%22name%22%3A+%22CHITU_SHARE_TAG%22%2C+%22value%22%3A+%22%22%7D%2C+%7B%22name%22%3A+%22TARGET%22%2C+%22value%22%3A+%22APP%22%7D%2C+%7B%22name%22%3A+%22ENV%22%2C+%22value%22%3A+%22STAGING%22%7D%2C+%7B%22name%22%3A+%22EXPERIMENT%22%2C+%22value%22%3A+true%7D%2C+%7B%22name%22%3A+%22RELEASE%22%2C+%22value%22%3A+false%7D%2C+%7B%22name%22%3A+%22GO_VERSION%22%2C+%22value%22%3A+%22go1.7rc1%22%7D%5D%2C+%22statusCode%22%3A+%22303%22%2C+%22redirectTo%22%3A+%22.%22%7D&Submit=%E5%BC%80%E5%A7%8B%E6%9E%84%E5%BB%BA' --compressed
}


stagingv() {
    curl http://staging.chitu.cn/config/version
}
