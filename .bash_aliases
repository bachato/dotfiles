### OS VERSION/RELEASE  ###
alias my_os='lsb_release -i'
alias my_rl='lsb_release -r'
alias myosr='my_os && my_rl'

### FILE ALIASES ###
alias sudo='sudo '
alias sdo='sudo !!'
alias brc='source ~/.bashrc'
alias bba='source ~/.bash_aliases'
alias zrc='source ~/.zshrc'

alias upd='clear && sudo apt update'
alias upg='clear && sudo apt update && sudo apt upgrade -y && sudo apt autoremove && sudo apt clean && sudo apt full-upgrade'

alias df="df -h"
alias left='ls -t -1'
alias c='clear'
alias bat=batcat
alias ls=lsd
alias clr='c && neofetch'
alias cll='c && ll'
alias ll='ls -Ahl --group-directories-first'
alias lt='ls --human-readable --size -1 -S --classify'
alias gh='history|grep'
alias count='find . -type f | wc -l'
alias tcn='mv --force -t ~/.local/share/Trash '
alias cmount="mount | column -t"
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^/]*//--/g' -e 's/^/   /' -e 's/-/|/'"
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p"
alias meminfo='free -m -l -t'
alias psg="ps aux | grep"
alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"
alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"
alias listen="lsof -P -i -n"
alias port='netstat -tulanp'
alias ipinfo="curl ifconfig.me && /\r && curl ifconfig.me/host"
alias python=python3
alias lz='eza -aghloF --icons --group-directories-first'


### SSH-AGENT ALIASES  ###
alias sshaz='ssha && sshg && sshl && ssht'
alias sshr='sshk && ssha && sshg && sshl && ssht'
alias sshk='killall ssh-agent; eval `ssh-agent`'
alias ssha='ssh-add ~/.ssh/ansible'
alias sshg='ssh-add ~/.ssh/github'
alias ssht='ssh-add ~/.ssh/gitea'
alias sshl='ssh-add ~/.ssh/home_lab'


### KITTY ALIASES ###
alias kssh='kitty +kitten ssh'
alias kic='kitty +kitten icat'


### DIRCETORY TRAVERSAL ALIASES ###
alias hm='cd ~'
alias home='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'


### ANSIBLE ALIASES ###
#alias aver=ansible-version                     ### Show the version on ansible installed in this host
#alias arinit=ansible-role-init <role name>     ### Creates the Ansible Role as per Ansible Galaxy standard
alias a=ansible
alias aconf=ansible-config
alias acon=ansible-console
alias ainv=ansible-inventory
alias aplaybook=ansible-playbook
alias ainv=ansible-inventory
alias adoc=ansible-doc
alias agal=ansible-galaxy
alias apull=ansible-pull
alias aval=ansible-vault


### GIT ALIASES ###
alias startgit='cd `git rev-parse --show-toplevel` && git checkout master && git pull'
alias cg='cd `git rev-parse --show-toplevel`'

alias got='git '
alias get='git '

alias config='/usr/bin/git --git-dir=/home/bachato/.cfg/ --work-tree=/home/bachato'

alias gg='git '
alias gp='git push '
alias gl='git pull '
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
#alias gk='gitk --all&'
#alias gx='gitx --all'

alias zz='config '
alias zp='config push '
alias zl='config pull '
alias zs='config status '
alias za='config add '
alias zb='config branch '
alias zc='config commit'
alias zd='config diff'
alias zo='config checkout '
#alias zk='gitk --all&'
#alias zx='gitx --all'


### DOCKER ALIASES ###
function dnames-fn {
        for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
        do
        docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
        done
}

function dip-fn {
    echo "IP addresses of all named running containers"

    for DOC in `dnames-fn`
    do
        IP=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' "$DOC"`
        OUT+=$DOC'\t'$IP'\n'
    done
    echo -e $OUT | column -t
    unset OUT
}

function dex-fn {
        docker exec -it $1 ${2:-bash}
}

function di-fn {
        docker inspect $1
}

function dl-fn {
        docker logs -f $1
}

function drun-fn {
        docker run -it $1 $2
}

function dcr-fn {
        docker-compose run $@
}

function dsr-fn {
        docker stop $1;docker rm $1
}

function drmc-fn {
       docker rm $(docker ps --all -q -f status=exited)
}

function drmid-fn {
       imgs=$(docker images -q -f dangling=true)
       [ ! -z "$imgs" ] && docker rmi "$imgs" || echo "no dangling images."
}

# in order to do things like dex $(dlab label) sh
function dlab {
       docker ps --filter="label=$1" --format="{{.ID}}"
}

function dc-fn {
        docker-compose $*
}

function d-aws-cli-fn {
    docker run \
           -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
           -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
           -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
           amazon/aws-cli:latest $1 $2 $3
}

alias daws=d-aws-cli-fn
alias dc=dc-fn
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcr=dcr-fn
alias dex=dex-fn
alias di=di-fn
alias dim="docker images"
alias dip=dip-fn
alias dl=dl-fn
alias dnames=dnames-fn
alias dps="docker ps"
alias dpsa="docker ps -a"
alias drmc=drmc-fn
alias drmid=drmid-fn
alias drun=drun-fn
alias dsp="docker system prune --all"
alias dsr=dsr-fn


### FAST/NEO/P/CPU FETCH ALIASES###
alias alf='c && nf && cf && pf && ff'
alias ff=fastfetch
alias nf=neofetch
alias cf=cpufetch
alias pf=pfetch
alias cff='c && ff'
alias cnf='c && nf'
alias ccf='c && cf'
alias cpf='c && pf'


### PYTHON ALIASES ###
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'


### RSYNC ALIASES ###
alias cpv='rsync -ah --info=progress2'


### NALA ALIASES ###
alias apt='nala'
alias apt-get='nala'


######################
### MISC FUNCTIONS ###
######################


### EXTRACT ANY FILE  ###
extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


### PAUSE  ###
function pause() {
 #read -s -n 1 -p "Continue..."
 read -s -n 1 -p  "Press any key to continue or crtl-c exit program..."
 echo ""
}


alias grep='grep --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ip='ip -c'
alias cat=batcat
alias update='sudo apt update'
alias upgrade='sudo apt update && time sudo apt upgrade'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
