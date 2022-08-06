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

#alias each shell_script in ~/.shellscripts/* having .a.sh prefix
for shell_script in ~/.shellscripts/*/*.a.sh; do
  #desiredalias=$(basename -s ".sh" "$shell_script")
  ##M if command already set
  #~ if ! type "$desiredalias" > /dev/null; then
    #~ #set name of script for alias
    #~ alias $(basename -s ".sh" "$shell_script")="sh $shell_script"
  #~ else
    #~ #prepend aik_
    #~ echo "$desiredalias"" is already in use - shell script will be aliased as aik_""$desiredalias"
    #~ alias "aik_"$(basename -s ".sh" "$shell_script")="sh $shell_script"
    #~ #echo "foreced alias ""$desiredalias"
    #~ #alias $(basename -s ".a.sh" "$shell_script")="sh $shell_script"
  #~ fi

  # shellcheck disable=SC2086
  # shellcheck disable=SC2046
  # shellcheck disable=SC2139
  alias $(basename -s ".a.sh" "$shell_script")="sh $(realpath $shell_script)"
done
for shellscriptbin in ~/.shellscripts/*/*.b.sh; do
  # shellcheck disable=SC2046
  rm -f "$HOME"/.shellscripts/bin/dyn/$(basename -s ".b.sh" "$shellscriptbin")
  ln -s "$shellscriptbin" "$HOME"/.shellscripts/bin/dyn/$(basename -s ".b.sh" "$shellscriptbin")
  chmod +x "$HOME"/.shellscripts/bin/dyn/$(basename -s ".b.sh" "$shellscriptbin")
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
alias unlock-pacman='sudo rm /var/lib/pacman/db.lck'
alias SCC='sudo echo "J" | sudo pacman -Scc && printf "\n"' #clear cache
alias Y='yaourt'

### UNI
alias vpn='cat ~/.pw/uni_vpn  | cut -d ':' -f2 | sudo openconnect -u $(cat ~/.pw/uni_vpn  | cut -d ':' -f1) --passwd-on-stdin vpn-gate-1.uni-bielefeld.de & disown'

### ARBEIT
##alias A='date --iso-8601=seconds  -d "+8 hours +30 minutes" > .feierabend'

alias dcrmwf='OLDDIR=$(pwd); cd ~/PRJ/mwf/firstspirit-mwf-docker-environment/ && docker-compose stop && sleep 1 && docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d; cd $OLDDIR'
alias dsmwf='OLDDIR=$(pwd); cd ~/PRJ/mwf/firstspirit-mwf-docker-environment/ && docker-compose stop'

alias fsmwf='~/PRJ/firstspirit_2021-05-07/FSLauncher/FSLauncher ~/Downloads/config.fslnch & disown'

alias dcrgkv='OLDDIR=$(pwd); cd ~/PRJ/gkv/gkv-docker/ && docker-compose -f docker-compose.yml -f docker-compose.local.yml stop && sleep 1 && docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d fs5 mssql tomcat-sv-web; cd $OLDDIR'
alias fsgkv='~/PRJ/gkv/FSLauncher/FSLauncher ~/Downloads/config.fslnch & disown'

alias fsepp='export JDK_JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel" ; ~/PRJ/epp/FSLauncher/FSLauncher ~/Downloads/config.fslnch & disown'

alias fsschu='~/PRJ/fs-schulung/FSLauncher/FSLauncher ~/Downloads/config.fslnch & disown'
alias backupkube='kubectl exec -it firstspirit-statefulset-0  -- bash -c "cp -af /opt/firstspirit5/. /opt/backup-full/firstspirit5"'

alias dcrdc='OLDDIR=$(pwd); cd ~/PRJ/fs-docker/ && docker-compose -f docker-compose.yml -f docker-compose.local.yml stop && sleep 1 && docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d; cd $OLDDIR'
alias fsdc='~/PRJ/fs-docker/FSLauncher/FSLauncher ~/Downloads/config.fslnch & disown'
alias fsJOptions='export JDK_JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel" ; '
#TODO put in functions file
function jsonValue() {
    KEY=$1
    num=$2
    awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}

