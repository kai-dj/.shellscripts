#!/usr/bin/env bash
#
# ~/.config/aik/linux/alias.sh
#

#git with en_US locale
alias git='LANGUAGE=en_Us git'
#shortcut for re-sourcing bashrc
alias sbrc='source ~/.bashrc && echo bashrc sourced'
#list available functions
alias falias='declare -F'
#source aliases for worms armageddon
#source ~/.worms/wurmaliasse.sh

#alias each shellscript in ~/.shellscripts/* having .a.sh prefix
for shellscript in ~/.shellscripts/*/*.a.sh; do
  #desiredalias=$(basename -s ".sh" "$shellscript")
  ##test if command already set
  #~ if ! type "$desiredalias" > /dev/null; then
    #~ #set name of script for alias
    #~ alias $(basename -s ".sh" "$shellscript")="sh $shellscript"
  #~ else
    #~ #prepend aik_
    #~ echo "$desiredalias"" is already in use - shell script will be aliased as aik_""$desiredalias"
    #~ alias "aik_"$(basename -s ".sh" "$shellscript")="sh $shellscript"
    #~ #echo "foreced alias ""$desiredalias"
    #~ #alias $(basename -s ".a.sh" "$shellscript")="sh $shellscript"
  #~ fi
  alias $(basename -s ".a.sh" "$shellscript")="sh $(realpath $shellscript)"
done

#chmod
alias +r='chmod +r'
alias +w='chmod +w'
alias +x='chmod +x'
alias s+r='sudo chmod +r'
alias s+w='sudo chmod +w'
alias s+x='sudo chmod +x'

#chown
alias ownme="sudo chown -R $(whoami):$(id -gn)"

#ls
alias l='ls -l'
alias la='ls -la'

#xterm
alias xterm='xterm -bg black -fg white'

#git
alias gc='git clone'
alias gs='git status'
alias gf='git fetch'
alias gp='git pull'
alias gfp='git fetch && git pull'

#ntp
alias Z='sudo ntpdate -u ntp.ubuntu.com'

#sudo
alias s='sudo su'

#powermgmt
alias q='sudo shutdown -h now'
alias r='sudo reboot'

#x-server
alias x='startx'

#tar
alias tarn='tar -vcf'
alias untar='tar -vxf'

#dos
alias DOS='dosbox -conf ~/.DOS/dosbox.conf'

#svg reload
alias svgreload='python2 ~/.shellscripts/tools/svgreload.py'

#watch files for mod
alias when-mod='while sh ~/.shellscripts/tools/sleep_until_modified.sh'

#virtualbox
alias vb='sudo modprobe vboxdrv && VirtualBox & disown'

#youtube
alias yt='youtube-dl'

### sc and midi
alias playmidi='fluidsynth -a alsa -m alsa_seq -l -i /usr/share/soundfonts/FluidR3_GM.sf2'

#cd&co
alias 'cd..'='cd ..'
alias '..'='cd ..'
function mkcd () { mkdir -p "$@"; cd "$1"; }

#php
alias php='php -d short_open_tag=On'
alias servedir_php='php -S localhost:8000'


# pacman
alias SS='sudo pacman -Ss' #search pacman.db
alias SYU='sudo pacman -Syu' #update
alias S='yaourt -Syu --aur' #update +aur
alias RSS='sudo pacman -Rss'
alias RS='sudo pacman -Rs'
alias SCC='sudo echo "J" | sudo pacman -Scc && printf "\n"' #clear cache
alias Y='yaourt'

### UNI
alias vpn='cat ~/.pw/uni_vpn  | cut -d ':' -f2 | sudo openconnect -u $(cat ~/.pw/uni_vpn  | cut -d ':' -f1) --passwd-on-stdin vpn-gate-1.uni-bielefeld.de & disown'

### ARBEIT
alias arbeit='date --iso-8601=seconds  -d "+8 hours +30 minutes" > .feierabend'

alias dcrmwf='OLDDIR=$(pwd); cd ~/PRJ/firstspirit_2021-05-07/firstspirit-mwf-docker-environment/ && docker-compose stop && sleep 1 && docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d; cd $OLDDIR'
 alias dsmwf='OLDDIR=$(pwd); cd ~/PRJ/firstspirit_2021-05-07/firstspirit-mwf-docker-environment/ && docker-compose stop'

alias fsmwf='~/PRJ/firstspirit_2021-05-07/FSLauncher/FSLauncher ~/Downloads/config.fslnch & disown'

alias dcrgkv='OLDDIR=$(pwd); cd ~/PRJ/gkv/gkv-docker/ && docker-compose -f docker-compose.yml -f docker-compose.local.yml stop && sleep 1 && docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d fs5 mssql tomcat-sv-web; cd $OLDDIR'
alias fsgkv='~/PRJ/gkv/FSLauncher/FSLauncher ~/Downloads/config.fslnch & disown'

