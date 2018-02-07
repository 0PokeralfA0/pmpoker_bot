#!/usr/bin/env bash

cd $HOME/pmpoker_bot

install() {
		 apt-get update
		 apt-get upgrade
 apt-get install lua5.1 luarocks lua-socket lua-sec redis-server curl 
 luarocks install oauth 
 luarocks install redis-lua 
 luarocks install lua-cjson 
 luarocks install ansicolors 
 luarocks install serpent 
}

function print_logo() {
	green "          ____  ____     _____"
	green "         |  _ )|  _ \   |_   _|___ ____   __  __"
	green "         |  _ \| |_) )    | |/ .__|  _ \_|  \/  |"
	green "         |____/|____/     |_|\____/\_____|_/\/\_|"
	echo -e "\n\e[0m"
}

function logo_play() {
    declare -A txtlogo
    seconds="0.010"
    txtlogo[1]=" ____  ____     _____"
    txtlogo[2]="|  _ )|  _ \   |_   _|___ ____   __  __"
    txtlogo[3]="|  _ \| |_) )    | |/ .__|  _ \_|  \/  |"
    txtlogo[4]="|____/|____/     |_|\____/\_____|_/\/\_|"
    printf "\e[31m\t"
    for i in ${!txtlogo[@]}; do
        for x in `seq 0 ${#txtlogo[$i]}`; do
            printf "${txtlogo[$i]:$x:1}"
            sleep $seconds
        done
        printf "\n\t"
    done
    printf "\n"
	echo -e "\e[0m"
}
function helppoker(){
declare -A txthelp
seconds="0.010"
     txthelp[1]="install   - نصب سورس و راه اندازی ان"
     txthelp[2]="update    - اپدیت کردن سورس شما به اخرین ورژن ان"
     txthelp[3]="@poker_alfa"
     for i in ${!txthelp[@]}; do
        for x in `seq 0 ${#txthelp[$i]}`; do
            printf "${txthelp[$i]:$x:1}"
            sleep $seconds
        done
        printf "\n\t"
    done
    printf "\n"
	echo -e "\e[0m" 
	}
function beyondteam() {
	echo -e "\e[0m"
	green "     >>>>                       We Are Not Attacker                             "
	green "     >>>>                       We Are Not Alliance                             "
	white "     >>>>                       We Are Programmer                               "
	white "     >>>>                       We Are The Best                                 "
	red   "     >>>>                       We Are Family                                   "
	red   "     >>>>                       @poker_alfa                                     "
	echo -e "\e[0m"
}

red() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
green() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
white() {
  printf '\e[1;37m%s\n\e[0;39;49m' "$@"
}
update() {
	git pull
}

if [ "$1" = "help" ]; then
        helppoker
elif [ "$1" = "install" ]; then
	print_logo
	beyondteam
	logo_play
	install
elif [ "$1" = "update" ]; then
	logo_play
	beyondteam
	update
	exit 1
else
	print_logo
	beyondteam
	logo_play
	green "Beyond Messenger Bot running..."
	#sudo service redis-server restart
	lua ./bot/bot.lua
fi
