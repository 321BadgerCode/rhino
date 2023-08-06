#!/bin/bash

#####
#[._.]: /home/badger_code/document/code/sh/etc/load_bar.sh(source file):
#####

#badger
load(){
	local text=${1:-"loading..."}
	local percent=${2:-100}
	local wait_time=${3:-.01}
	local is_percent_max=${4:-true}
	local char=${5:-'.'}
	local border=${6:-'|'}
	local border2=${7:-'|'}

	local b1=80 b2=0 b3=0;shift

	for (( a=1; a<=$percent; a++ ));do
		b2="$a"

		if [ "$is_percent_max" = false ];then b3=100
		else b3=$percent
		fi

		printf -v dot "%*s" "$(( $b1*$b2/$b3 ))" "";dot=${dot// /$char}
		printf "\r\e[K${border}%-*s${border2} %3d%% %s" "$b1" "$dot" "$b2" "$text"

		sleep $wait_time
	done;echo
}

#####
#[._.]: /home/badger_code/document/code/sh/etc/key_word.sh(source file):
#####

#badger
a1=$1
a2=$@

set_key_word(){
	local key_word="$1"
	local func=$2

	if [ "$a1" == "$key_word" ];then $func && exit
	fi
}

is_key_word(){
	local key_word="$1"

	[[ "$a2" =~ "$key_word" ]]
}

get_key_word_input(){
	local key_word="$1"

	local b1=''
	local b2=''

	if [[ "$a2" =~ "$key_word " ]];then
		b1="${a2##*${key_word} }"
		b2="${b1% *}"
	fi

	echo "$b2"
}

#####
#[._.]: /home/badger_code/document/code/sh/etc/info.sh(source file):
#####

#badger
get_current_path(){
	echo "$PWD"
}

get_prev_path(){
	echo "$OLDPWD"
}

get_current_file_name(){
	echo "${0##*/}"
}

#####
#[._.]: /home/badger_code/document/code/sh/etc/device.sh(source file):
#####

#badger
get_os_type(){
	echo $(uname)
}

get_os_type2(){
	echo "$OSTYPE"
}

get_user(){
	echo "$USER"
}

get_ip(){
	ifconfig eth0 | grep "inet " | cut -c 14-26

	echo "$?"
}

#####
#[._.]: /home/badger_code/document/code/sh/etc/color.sh(source file):
#####

#badger
black="\033[0;30m"
red="\033[0;31m"
orange="\033[0;33m"
yellow="\033[1;33m"
green="\033[1;32m"
blue="\033[1;34m"
indigo="\033[0;35m"
violet="\033[1;35m"
white="\033[1;37m"

black2="30"
red2="31"
green2="32"
yellow2="33"
dark_blue2="34"
purple2="35"
light_blue2="36"
white2="37"

normal='0'
light='1'
dark='2'
italic='3'
underline='4'
blink='5'
highlight='7'
strike_through='9'

begin="\033["
end="\033[0m"

set_color(){
	local text=$1
	local color=${2:-${white}}
	local type=${3:-${normal}}

	echo -e "${begin}${type};${color}m${text}${end}"
}

black3=(0 0 0)
red3=(255 0 0)
orange3=(255 125 0)
yellow3=(255 255 0)
green3=(0 255 0)
blue3=(0 0 255)
indigo3=(50 0 125)
violet3=(255 125 255)
white3=(255 255 255)

set_ansi(){ echo -e "\e[${1}m${*:2}\e[0m"; }
set_bold(){ set_ansi 1 "$@"; }
set_dim(){ set_ansi 2 "$@"; }
set_italic(){ set_ansi 3 "$@"; }
set_underline(){ set_ansi 4 "$@"; }
set_blink(){ set_ansi 5 "$@"; }
set_invisible(){ set_ansi 8 "$@"; }
set_strike_through(){ set_ansi 9 "$@"; }
set_underline2(){ set_ansi 21 "$@"; }
set_overline(){ set_ansi 53 "$@"; }

set_fg_color(){
	local text=$1
	local color=${2:-${white[@]}}

	echo -e "\e[38;2;${color[0]};${color[1]};${color[2]}m${text}\e[0m"
}
set_bg_color(){
	local text=$1
	local color=${2:-${black[@]}}

	echo -e "\e[48;2;${color[0]};${color[1]};${color[2]}m${text}\e[0m"
}

#####
#[O-O]: /home/badger_code/download/rhino/rhino.sh(main/input file):
#####

#badger
#. /home/badger_code/document/code/sh/etc/color.sh #[._.]: this line has been edited(commented out) by ./compile.sh.
#. /home/badger_code/document/code/sh/etc/device.sh #[._.]: this line has been edited(commented out) by ./compile.sh.
#. /home/badger_code/document/code/sh/etc/info.sh #[._.]: this line has been edited(commented out) by ./compile.sh.
#. /home/badger_code/document/code/sh/etc/key_word.sh #[._.]: this line has been edited(commented out) by ./compile.sh.
#. /home/badger_code/document/code/sh/etc/load_bar.sh #[._.]: this line has been edited(commented out) by ./compile.sh.

rhino_logo="""
                   .^~~^..             .::.
          .~JPBBBGB#@@@@##G5J7~~~!7J5GB#&&#BP?^.				|	help:
      .^75#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@BY?77^				|
     7B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@G!				|	usage: rhino.
    !@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y    ..^^		|	syntax: rhino -[h|a|i|w].
   ~&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&^~5B#&@?		|
  :&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#@@@@@@!		|	option:
  7@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#5?^			|		h:	help.
  J@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@P			|		a:	about.
  J@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@P			|		i:	info.
  5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@!			|		w:	welcome.
^BG5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#.			|
!J..G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&5J?.       ~:	|
   ^&@@@@@@@@@##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@?     :?BG.	|
    B@@@@@@@B^..^?G&@@@@@@@@@#&@@@@@@@@@@@@@#P@@@@@@@@@@@@@@&Y?7?YG&@P.		|
   7@@@@@@@@G      :^^~~~!~^^.~@@@@@@@@@@@@B. ?&@@@@@@@@@@@@@@@@@@@B!		|
   G@@@@@@@@P                  B@@@@@@@@@@G:   ^Y#&@@@@@@@@@@@@@#P7.		|
   5@@@@@@@@@5:                5@@@@@@@@@G       .^?B@@@@@@@@@@@5		|
   :~77&@@@@@@#:               7@@@@@@@@@Y          .#@@@@@@@@@#~		|
      :5GGGBG57:               5@@@@@@@@@#?7.        ~G#@@@@&#G:		|
                              7@@@@@@@@@BGPY^          .^~~^..			|
                              !PGBPBB57~.					|
"""
rhino_logo2="$(base64 -d <<<"H4sICB4aAGMCA3JoaW5vLnR4dAClVDuOxSAM7HOKIEuUdMgSDZEbS1S0aXwUn32B/JO3+xR2miiEmQzY43F8wImqOHddC8ENp1dNmYiYYCoAYJ9QVQ0mX9asBcpRNoIT9G3fN9AcEWVhIU2vwKbxzPQac/PopP1Y7XsBK+rLoadYBEIHv1zg8qhHwKkT4GM9Qerl5/+SfS/ZDELcyQY3mOQcd5GtT3Frcw21/HKUD+CVVmwqIRIvbb+1L5UkSeST7rVDIN88lQzEuezPTWdvB15sBpGaMxVxeomOG+On1qMWi/168jPtp5xxqFcwPxxis3JUyIe7yPGN9yESzwn2VSEo4qoNdwm85nEVOWoAuk6T4Jm59AuGXz1AxH16KTcNCxyG8U8cDojzLI95+IVuMlOZiR7V/QBp9ZRZVAUAAA==" | gunzip)"
help(){
cat <<EOF
$rhino_logo
EOF
}
about(){
	echo -e "about:\n"
	echo -e "${red}* rhino is a lib. written in c++ made 4 linux O.S..${end}"
}
info(){
	echo -e "info.:\n"
	echo -e "author: ${blue}Badger Code${end}"
	echo -e "date created: ${orange}2022/8/19${end}"
	echo -e "version: ${green}1${end}"
	echo -e "dir.: ${yellow}$(get_current_path)/$(get_current_file_name)${end}."
}
welcome(){
	load

	clear

	echo -e "${blue}$rhino_logo2${end}\n"

	echo -e "${green}[._.]: howdy there${end} ${blue}$(get_user)${end}${green}; welcome to the rhino lib.!${end}"
	echo -e "[._.]: type \"${orange}rhino -h${end}\" in your terminal 4 help."
}

set_key_word "-h" help
set_key_word "-a" about
set_key_word "-i" info
set_key_word "-w" welcome

welcome