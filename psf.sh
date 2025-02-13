﻿
#!/usr/bin/env bash

#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃ Project : psFconsole                             ┃
#┃ Author  : Osman 穆罕默德                           ┃
#┃ Version : 8.5.1 (Latest)                                    ┃
#┃ Github  : anonynusman <github.com/anonynusman>    ┃
#┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

__return__ () {
source __return__ &> /dev/null
if [[ ! $? == 105 ]]
then
printf 105
fi
}

set +x

if [[ $_ == "+x" ]]
then
debug="false"
else
debug="true"
fi

__return__=$(printf "$(__return__)")

WAIT() {
sleep 0.01
}

# Prompt

PROMPT=1

# Variable

export RAWLINK=https://raw.githubusercontent.com/Anonynusman/psFconsole/master/psf.sh
export GITLINK=https://github.com/Anonynusman/psFconsole
export OS=$(uname -o | grep -o "Android")
export OUTPUT=$HOME/.history.psf
CWD=$(pwd)
SUBMODULE=16
MODULE=07
VAR=8.5.1
PSNUM=3
NUM=1

# Modules options list

if [[ ! $__return__ == 105 ]];then
source $CWD/assets/programs/list.modules
source $CWD/assets/programs/info.psfconsole
else
source <(curl -sLo- "${RAWLINK}/assets/programs/list.modules")
source <(curl -sLo- "${RAWLINK}/assets/programs/info.psfconsole")
fi

# Colors

C0="$(printf '\033[90m')"  B0="$(printf '\033[100m')"
C1="$(printf '\033[91m')"  B1="$(printf '\033[101m')"
C2="$(printf '\033[92m')"  B2="$(printf '\033[102m')"
C3="$(printf '\033[93m')"  B3="$(printf '\033[103m')"
C4="$(printf '\033[94m')"  B4="$(printf '\033[104m')"
C5="$(printf '\033[95m')"  B5="$(printf '\033[105m')"
C6="$(printf '\033[96m')"  B6="$(printf '\033[106m')"
C7="$(printf '\033[97m')"  B7="$(printf '\033[107m')"
R0="$(printf '\033[00m')"
R1="$(printf '\033[01m')"
R2="$(printf '\033[02m')"
R3="$(printf '\033[03m')"
R4="$(printf '\033[04m')"
R5="$(printf '\033[05m')"
R6="$(printf '\033[06m')"
R7="$(printf '\033[07m')"

# Sign

r0SIGN="${C1}(${R0}>${C1})${R0}"
r1SIGN="${C1}(${R0}!${C1})${R0}"

g0SIGN="${C2}(${R0}>${C2})${R0}"
g1SIGN="${C2}(${R0}!${C2})${R0}"

b0SIGN="${C4}(${R0}>${C4})${R0}"
b1SIGN="${C4}(${R0}!${C4})${R0}"

# Psf Requirements

if [[ ! $__return__ == 105 ]];then
source $CWD/assets/programs/requirements.psf
else
source <(curl -sLo- "${RAWLINK}/assets/programs/requirements.psf")
fi

sudoPERM() {
if [[ $OS == *'Android'* ]];then
:
else
sudo -v
fi
}

setOS() {
if [[ $OS == *'Android'* ]];then
printf "$1"
# "$1"
else
printf "$2"
# "$2"
fi
}


# <<<--- Interpreter Section ! --->>>

killZONE() {
if [[ ! $__return__ == 105 ]];then
bash $CWD/assets/programs/progress.kill
else
bash <(curl -sL "${RAWLINK}/assets/programs/progress.kill")
fi
}

cacheFILES() {
if [[ ${MODE} == "withPHISH/OTPWEB" ]]
then
rm -rf "${SCRIPT_PATH[@]}"/"${OSITES[${input} -1]}" &> /dev/null
elif [[ ${MODE} == "withPHISH/NOTPWEB" ]]
then
rm -rf "${SCRIPT_PATH[@]}"/"${SITES[${input} -1]}" &> /dev/null
elif [[ ${MODE} == "withPHISH/GPSWEB" ]]
then
rm -rf "${SCRIPT_PATH[@]}"/"${GSITES[${input} -1]}" &> /dev/null
elif [[ ${MODE} == "withPHISH/CAMWEB" ]]
then
rm -rf "${SCRIPT_PATH[@]}"/"${CSITES[${input} -1]}" &> /dev/null
elif [[ ${MODE} == "withPHISH/MICWEB" ]]
then
rm -rf "${SCRIPT_PATH[@]}"/"${MSITES[${input} -1]}" &> /dev/null
elif [[ ${MODE} == "withATTACK/DDOS" ]]
then
rm -rf $PWD/programs/withATTACK/DDOS/ddos &> /dev/null
fi
}

interruptPSF() {
printf "                                                  \r"
echo -e "${r0SIGN} Psfconsole is Interrupted                "
exit 0
}

interrupt () {
exit_on_signal_SIGINT () { killZONE
if [[ ! $__return__ == 105 ]];then
if [[ ${ARG} == "-s" ]];then
if [[ ${SITENUM} == "${SITENUM}" ]];then
rm -rf "${SCRIPT_PATH[@]}"/"${SITENUM}" &> /dev/null
fi
else
cacheFILES
fi
interruptPSF
else
interruptPSF
fi
}

exit_on_signal_SIGTSTP () { killZONE
if [[ ! $__return__ == 105 ]];then
rm -rf "${SCRIPT_PATH[@]}"/"${SITES[${input} -1]}" &> /dev/null
if [[ ${ARG} == "-s" ]];then
if [[ ${SITENUM} == "${SITENUM}" ]];then
rm -rf "${SCRIPT_PATH[@]}"/"${SITENUM}" &> /dev/null
fi
else
cacheFILES
fi
interruptPSF
else
interruptPSF
fi
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTSTP SIGTSTP
}

# <<<--- Help Section --->>>

MODULE() {
for i in "${MODULES[@]}"
  do
  KEY=$(printf "%02d" $NUM)
  LOOP=$((${LOOP:-0}+1))
  SHOW=${i::$((${#i}))}
  printf "${C3}${SHOW}${R0}\n"
  ((NUM++))
  done
}

SUBMODULE() {
for i in "${SUBMODULES[@]}"
  do
  KEY=$(printf "%02d" $NUM)
  LOOP=$((${LOOP:-0}+1))
  SHOW=${i::$((${#i}))}
  printf "${C3}${SHOW}${R0}\n"
  ((NUM++))
  done
}

helpCOMMANDS () {
echo -e "
${B0}Console Commands${R0}
================

    Command     Description
    -------     -----------
    ${C2}show modules${R0} Command to displays available modules.
    ${C2}quit${R0}         Command to exit psfconsole instance.
    ${C2}clear${R0}        Command to clear screen.
    ${C2}help${R0}         Command to show help meunu.
    ${C2}search${R0}       Command to search available module.
    ${C2}banner${R0}       Command to shows a random banner.
    ${C2}history${R0}      Command to show command history.
    ${C2}version${R0}      Command to show the framework version.


${B0}Module Commands${R0}
===============

    Command     Description
    -------     -----------
    ${C2}use${R0}         Command to call existing module${R1}s${R0}.
    ${C2}list${R0}        Command to show available option in module${R1}s${R0}.
    ${C2}info${R0}        Command to information about module${R1}s${R0}.
    ${C2}back${R0}        Command to move back to main console.

${B0}psfconsole${R0}
==========

\`${C4}psfconsole${R0}\` is a bundle of penetration testing tools and an interface to Pentesting Framework.
This framework is currently undergoing heavy development. So, please be patient and keep an eye on this space!
"
}


# <<<--- Show [cmd] Section ! --->>>

moduleCOMMANDS() {
echo -e "
${B0}Available Modules${R0}
=================

$(MODULE)

${B0}Available SubModules${R0}
====================

$(SUBMODULE)

Usage: ${C3}use with:<module>/<submodule>/handler${R0}

    Available Commands             Description
    ----------------------------      -----------
    ${C2}use with:phish/otpweb/handler${R0}     module to run with:otp phishing site${R1}s${R0}.
    ${C2}use with:phish/notpweb/handler${R0}    module to run with:notp phishing site${R1}s${R0}.
    ${C2}use with:phish/gpsweb/handler${R0}     module to create geolocation phishing site${R1}s${R0}.
    ${C2}use with:phish/camweb/handler${R0}     module to create camera phishing site${R1}s${R0}.
    ${C2}use with:phish/micweb/handler${R0}     module to create microphone phishing site${R1}s${R0}.
    ${C2}use with:bomber/callnsms/handler${R0}  module to perform a bombing attack.
    ${C2}use with:lookup/user/handler${R0}      module to gather information of user${R1}s${R0}.
    ${C2}use with:lookup/number/handler${R0}    module to gather information of number${R1}s${R0}.
    ${C2}use with:remote/payload/handler${R0}   module to create a metasploit payload
                                      for your target device${R1}s${R0}.
    ${C2}use with:brute/social/handler${R0}     module to perform social bruteforce attack.
    ${C2}use with:brute/hashes/handler${R0}     module to perform hashes bruteforce attack.
    ${C2}use with:attack/ddos/handler${R0}      module to perform ddos attack on site${R1}s${R0}.
    ${C2}use with:secure/hashes/handler${R0}    module to generate hashing algorithm.
    ${C2}use with:secure/passwd/handler${R0}    module to generate strong password${R1}s${R0}.

    Upcomming Modules                 Description
    ----------------------------      -----------
    ${C6}use with:steganography/handler${R0}    module to keep secret message${R1}s${R0}.
"
}

infoCOMMANDS() {
NETWORK() {
connection() {
curl -Is http://www.google.com &> /dev/null
}
connect() {
connection
if [[ $? == 0 ]]
then
echo "Online             Psf have proper connection"
else
echo "Offline            Psf doesn't have connection"
fi
}
NETWORK=$(printf "$(connect)")
}

TYPE() {
type() {
if [[ ! $__return__ == 105 ]];then
echo "Offline            Psf is running on system"
else
echo "Online             Psf is running on temp"
fi
}
TYPE=$(printf "$(type)")
}

logPRINT() {
printf "\rConnecting to Network ..."
}

logREMOVE() {
printf "\r                         "
}

UPDATE() {
UPDATE=$(cat <(curl -sLo- git.io/pSf) | grep "VAR" | awk '{print $1}' | head -n1 | cut -c 5-)
}

logPRINT & TYPE
logPRINT & UPDATE
logPRINT & NETWORK
logPRINT && logREMOVE

if [[ $VAR != $UPDATE ]]
then
STATUS=$(echo "Available          Update command: psf update")
else
STATUS=$(echo "Unavailable        Check available update")
fi

echo -e "
Available Info:
===============

   Option         Current Setting    Description
   -------        ---------------    -----------
   Running        $TYPE
   PsfUpdate      $STATUS
   Connection     $NETWORK
"
}

pluginCOMMANDS() {
echo -e "${g0SIGN} Available Framework plugins:
    * api key
    * history
    * json
    * ls.gd
    * ngrok
    * prompt
    * request
    * token
"
}


optionCOMMANDS() {
echo -e "
Global Options:
===============

   Option             Current Setting      Description
   ------             ---------------      -----------
   ConsoleDebug       $debug                Console output with debug mode
   HistoryLog         $LOG                   Verbosity of logs
   Prompt             psf prompt=$PROMPT         The prompt string
   PromptChar         $STYLE               The prompt character
"
}


# <<<--- Installer --->>>

if [[ ${1} == "-i" || ${1} == "--install" ]];then
if [[ ! $__return__ == 105 ]];then
source $CWD/assets/programs/setup.psfconsole
else
source <(curl -sLo- "${RAWLINK}/assets/programs/setup.psfconsole")
fi
exit 0

elif [[ ${1} == "-u" || ${1} == "--update" ]];then
if [[ ! $__return__ == 105 ]];then
source $CWD/assets/programs/update.psfconsole
else
source <(curl -sLo- "${RAWLINK}/assets/programs/update.psfconsole")
fi
exit 0

elif [[ ${1} == "-r" || ${1} == "--remove" ]];then
if [[ ! $__return__ == 105 ]];then
source $CWD/assets/programs/remove.psfconsole
else
source <(curl -sLo- "${RAWLINK}/assets/programs/remove.psfconsole")
fi
exit 0
fi


if [[ ! $__return__ == 105 ]];then
source $CWD/assets/programs/credentials.site
else
source <(curl -sLo- "${RAWLINK}/assets/programs/credentials.site")
fi


# <<<--- Argument Section ! --->>>

if [[ ${1} == "-h" || ${1} == "--help" ]]
then
echo -e "
Usage: psfconsole [options]

Module options:
       module=[submodule] command=[STRING/INTEGER] :
       Jump to specific module whatever belong to submodule and run aswell.

Console options:
       -v, --version  Check framework version.
       -h, --help     Show framework help menu.
       -d, --debug    Show logs in debugging mode.
       prompt=[NUM]   Set a different prompt while start.
       -q, --quite    Do not print the banner on startup.
       -o, --output   Output to the specified file
"
exit 0

elif [[ ${1} == "-v" || ${1} == "--version" ]]
then
echo "Framework Version: release v${VAR}"
exit 0

elif [[ ${1} == "-d" || ${1} == "--debug" ]]
then
set -x
debug="true"

elif [[ ${1} == "-o" || ${1} == "--output" ]]
then
$(basename $0) | tee > $2 || exit 0
fi

if [[ ${1} == "prompt="* ]]
then
 INT=$(printf "${1#prompt=}")
  INT=${INT#0}
  if [[ ${INT} =~ ^-?[0-9]*[.,]?[0-9]*[eE]?-?[0-9]+$ ]]
   then
   if [[ ! ${INT} -gt ${PSNUM} ]]
    then
       if [[ ! $__return__ == 105 ]]
        then
        FIND=$(grep -w "PROMPT=*" $(basename $0) | awk NR==1)
        sed -i "s/$FIND/PROMPT=$INT/g" $(basename $0)
        PROMPT=$INT
        else
        PROMPT=$INT
       fi
    else
    echo "${r0SIGN} Your Prompt Number digit must be above ${C1}${INT}${R0} <= ${C2}${PSNUM}${R0}"
   fi
 fi
fi


if [[ ${1} == "module="* ]]
then
 INT=$(printf "use with:${1#module=}")
  CHC="${INT#use with:}"
  if [[ ${#CHC} -lt 1 ]]
   then
   echo -e "${r0SIGN} Literally module=‘nothing’ add a submodule like : lookup/user/handler"
   exit 1
  fi

 if [[ ${2} == "command="* ]]
  then
   CMD=$(printf "${2#command=}")
   if [[ ${#CMD} -gt 0 ]]
    then
    command=$INT
    input=$CMD
    FALSE=false
    else
    echo -e "${r0SIGN} Literally command=‘nothing’ add some command like : list"
    exit 1
   fi
 fi

 if [[ ${#CHC} -gt 0 ]] | [[ ${#CMD} -lt 1 ]]
  then
  echo -e "${r0SIGN} Now module=‘${INT}’, but command=‘nothing’ Please mention that."
  exit 1
 fi
fi


# <<<--- Read Section ! --->>>

readINPUT() {
if [[ ${input} == "list" ]]
 then
    $1

elif [[ ${input} =~ ^-?[0-9]*[.,]?[0-9]*[eE]?-?[0-9]+$ ]]
   then
    if [[ ${input} -lt $2 ]]
    then
    if [[ ! $__return__ == 105 ]];then
    source $CWD/programs/$3
    else
    cd $TMPDIR || exit 1
    printf "${b0SIGN} Downloading Program...   \r"
    source <(curl -sLo- "${RAWLINK}/programs/$3")
fi
fi
fi
     theERROR
     extarnalCMD
}


readINPUTS() {
if [[ $input == "$1" ]]
  then
     input=""
   if [[ ! $__return__ == 105 ]];then
    $2 $PWD/programs/$3
   else
   cd $TMPDIR || exit 1
   printf "${b0SIGN} Downloading Program...   \r"
   $2 <(curl -sLo- "${RAWLINK}/programs/$3")
fi
fi
    theERROR
    extarnalCMD
}

readLIST() {
if [[ $input == "list" ]]
     then
     $1
fi
}

cmdFALSE() {
if [[ ${FALSE} == "false" ]]
 then
if [[ ${#command} -gt 0 ]]
then
echo -e "${r0SIGN} Unsatisfied command ‘$command’ :: execute '?'/'help'"
fi
    exit 0
fi
}


# <<<--- Header Section ! --->>>

randomBANNER() {
RANDOMs=$(echo $((1 + $RANDOM % 13)))
if [[ ! $__return__ == 105 ]];then
bash assets/logos/logo."${RANDOMs}"
else
bash <(curl -sL "${RAWLINK}/assets/logos/logo.${RANDOMs}")
fi
}

randomTIP() {
RANDOMs=$(echo $((1 + $RANDOM % 2)))

case ${RANDOMs} in
1)
       printf "Psfconsole tip: When in a module, use ${C2}back${R0} to go\n";WAIT
       printf "back to the top level prompt\n\n";WAIT
       ;;
2)
       printf "Psfconsole tip: You can use ${C2}help${R0} to view all\n";WAIT
       printf "available commands and modules.\n\n";WAIT
       ;;
esac
}

theHEADER() {
randomBANNER
printf "+ -- --=[ ${C3}psfconsole release v${VAR}${R0} ]=-- -- +\n";WAIT
printf "+ -- --=[ ${C2}${MODULE} module - submodule ${SUBMODULE}${R0}  ]=-- -- +\n\n";WAIT
randomTIP
}

if [[ ! $1 == "-q" ]]
then
theHEADER
fi


function psfHISTORY () {
NUM=1

if [[ ! -f $OUTPUT ]]
 then
 touch $OUTPUT
fi

LOG=$(wc -l ${OUTPUT} | awk '{ print $1 }')


# <<<--- History Section ! --->>>

overHISTORY() {
TOT=$((LOG-30))
sed -n "${TOT},${LOG}p" $OUTPUT > .temp.history.psf && mv .temp.history.psf $OUTPUT
}

if [[ ${LOG} -gt 50 ]]
then
cd $HOME || exit 1
overHISTORY
LOG=$(wc -l ${OUTPUT} | awk '{ print $1 }')
fi


i=1

fetch() {
for (( c=1; c<=LOG; c++))
do printf "...\n"
done
}

declare -a LOGS=(
$(printf "$(fetch)")
)

historyLOOP() {
for i in "${LOGS[@]}"
  do
  KEY=$(printf "%02d" $NUM)
  LOOP=$((${LOOP:-0}+1))
  FILE=$(cat "$OUTPUT" | awk NR==${LOOP})
  history -s "${FILE}"
  ((NUM++))
  done
}
  historyLOOP
  LOOP=0
}


# <<<--- Psf Section ! --->>>

psf() {
psfHISTORY

if [[ $PROMPT == 1 ]]
then
read -r -e -p $'\e[4;0;0;0;0;0;0;0;0;4mpsf\e[0m > \e[0m' command
STYLE=$'\e[4mpsf\e[0m > \e[0m'

elif [[ $PROMPT == 2 ]]
then
read -r -e -p $'\e[0;104m \e[90m~/psf \e[0m\e[94m \e[0m' command
STYLE=$'\e[104m \e[90mpsf \e[0m\e[94m\e[0m'

elif [[ $PROMPT == 3 ]]
then
read -r -e -p $'\e[93;0;0;0;0;0;93mpsf\e[93m ➤ \e[0m' command
STYLE=$'\e[93mpsf\e[93m ➤ \e[0m'
fi

if [ ${#command} -gt 0 ]
then
if [[ $(cat "${OUTPUT}") == *"${command}"* ]]
then
sed -i "s,$command,,g" "$OUTPUT" | sed -i '/^$/d' "$OUTPUT"
sed -i "s,$command,,g" "$OUTPUT" | sed -i '/^$/d' "$OUTPUT"
echo "${command}" >> "$OUTPUT"
else
echo "${command}" >> "$OUTPUT"
fi
fi
}


# <<<--- Error Section ! --->>>

showERROR() {
echo -e "${r0SIGN} Unsatisfied command ‘${@:1}’ :: execute '?'/'help'"
}

showHISTORY() {
while IFS= read -r line; do
    LOOP=$((${LOOP:-0}+1))
    printf "${LOOP}  $line\n"
done < "$OUTPUT"
LOOP=0
}


ignoreCOMMAND() {
if [[ ${command-} == "set"* ]]
then
showERROR $command
command=""
fi

if [[ ${input-} == "set"* ]]
then
showERROR $input
input=""
fi
}


ignoreERROR() {
if [[ ${input} == "?" || ${input} == "help" ]]
then
   :

elif [[ ${input} == "list" ]]
then
   :

elif [[ ${CMD} == "list" ]]
then
   :

elif [[ ${input} == "back" ]]
then
   :

elif [[ ${input} == "info" ]]
then
   :

elif [[ ${input} == "banner" ]]
then
   :

elif [[ ${input} == "exit" ]]
then
   :

elif [[ ${input} == "q" ]]
then
   :

elif [[ ${input} == "clear" ]]
then
   :

elif [[ ${input} == *""* ]]
     then
  if [[ ${#input} -gt 0 ]]
   then
#     echo -e "\e[94m(\e[0mexec\e[94m)\e[0m: ${command}"
      $input 2>/dev/null
  if [[ $? == 0 ]]
     then
        :
        input=""
      else
         showERROR "$input"
         input=""
  fi
fi

else
  showERROR "$input"
  input=""
  fi
}

theERROR() {
command="$command"
  if [ ${#command} -gt 0 ]
   then
      showERROR $command
  fi

input="$input"

if [[ ${MODE} == "withBOMBER/CALLNSMS" ]]
then
  if [[ ! ${input} -lt "3" ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withLOOKUP/USRR" ]]
then
  if [[ ! ${input} -lt "3" ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withREMOTE/PAYLOAD" ]]
then
  if [[ ! ${input} -lt "9"  ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withBRUTE/SOCIAL" ]]
then
  if [[ ! ${input} -lt "3" ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withBRUTE/HASHES" ]]
then
  if [[ ! ${input} -lt "6" ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withATTACK/DDOS" ]]
then
  if [[ ! ${input} -lt "3" ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withLOOKUP/NUMBER" ]]
then
  if [[ ! ${input} == "run" ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withSECURE/HASHES" ]]
then
  if [[ ! ${input} -lt "10"  ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withSECURE/BINARY" ]]
then
  if [[ ! ${input} == "run"  ]]
     then
       ignoreERROR
fi
elif [[ ${MODE} == "withSECURE/PASSWD" ]]
then
  if [[ ! ${input} -lt "8"  ]]
     then
      ignoreERROR
  fi
fi

if [[ ${input} =~ ^-?[0-9]*[.,]?[0-9]*[eE]?-?[0-9]+$ ]]
 then
if [[ ${MODE} == "withPHISH/OTPWEB" ]]
then
  if [[ ! ${input} -lt "31" ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withPHISH/NOTPWEB" ]]
then
  if [[ ! ${input} -lt "31" ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withPHISH/GPSWEB" ]]
then
  if [[ ! ${input} -lt "5" ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withPHISH/CAMWEB" ]]
then
  if [[ ! ${input} -lt "5" ]]
     then
      ignoreERROR
  fi
elif [[ ${MODE} == "withPHISH/MICWEB" ]]
then
  if [[ ! ${input} -lt "2" ]]
     then
      ignoreERROR
  fi
fi

else
   if [[ ${#input} -gt 0 ]]
   then
      ignoreERROR
   fi
fi
}


# <<<--- Command Section ! --->>>

getCOMMANDS() {
  if [[ ${command} == "use with:phish/otpweb/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:phish/notpweb/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:phish/gpsweb/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:phish/camweb/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:phish/micweb/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:lookup/user/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:bomber/callnsms/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:remote/payload/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:brute/social/handler" ]]
   then
      TRUE=true

   elif [[ ${command} == "use with:brute/hashes/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:attack/ddos/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:lookup/number/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:secure/hashes/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:secure/passwd/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "use with:secure/binary/handler" ]]
   then
      TRUE=true

  elif [[ ${command} == "?" || ${command} == "help" ]]
   then
      helpCOMMANDS
      command=""

  elif [[ ${command} == "banner" ]]
     then
        theHEADER
        command=""

  elif [[ ${command} == "list" ]]
     then
        echo -e "${g0SIGN} 'list' command only works with Modules! :: execute '?'/'help'"
        command=""

 elif [[ ${command} == "info" ]]
     then
        echo -e "${g0SIGN} 'info' command only works with Modules! :: execute '?'/'help'"
        command=""

 elif [[ ${command} == "back" ]]
     then
        echo -e "${g0SIGN} 'back' command only works with Modules! :: execute '?'/'help'"
        command=""

 elif [[ ${command} == "version" ]]
     then
        echo -e "Framework Version: release v$VAR"
        command=""

  elif [[ ${command} == "exit" || ${command} == "quit" ]]
     then
        echo -e "${g0SIGN} Existing Psfconsole ..."
        exit 0
        command=""

  elif [[ ${command} == "psf update" ]]
     then
       git pull
       command=""
       exit 0

  elif [[ ${command} == "use" ]]
     then
        echo -e "Usage: use with:<module>/handler

Interact with a module by name term/index.
If a module name is not found, it will be treated as a search term.
An index from the exist module results can be selected if desired.

Examples:
  use with:info/handler
"
        command=""

  elif [[ ${command} == "search" ]]
     then
        echo -e "Usage: search module:<module>
       search submodule:<submodule>

Search with a module/submodule by name term/index.
If a module name is not found, it will be treated as a search term.
An index from the search results from exist module selected if desired.

Examples:
  search module:lookup
  search submodule:user
"
        command=""

  elif [[ ${command} == "search module:"* ]]
     then
        INPUT="${command#search module:}"
for i in "${MODULES[@]}"
  do
  KEY=$(printf "%02d" $NUM)
  LOOP=$((${LOOP:-0}+1))
  CATCH=${i::$((${#i}))}
  if [[ ${CATCH} == ${INPUT} ]]
  then
     echo -e "Module \e[105m${INPUT}${R0} is Available."
     break
  fi
  ((NUM++))
  done

if [[ ${CATCH} != ${INPUT} ]]
  then
    echo -e "Module \e[101m${INPUT}${R0} is not Available."
fi
        LOOP=0
        command=""


  elif [[ ${command} == "search submodule:"* ]]
     then
        INPUT="${command#search submodule:}"
for i in "${SUBMODULES[@]}"
  do
  KEY=$(printf "%02d" $NUM)
  LOOP=$((${LOOP:-0}+1))
  CATCH=${i::$((${#i}))}
  if [[ ${CATCH} == ${INPUT} ]]
  then
     echo -e "Sub Module \e[105m${INPUT}${R0} is Available."
     break
  fi
  ((NUM++))
  done

if [[ ${CATCH} != ${INPUT} ]]
  then
    echo -e "Sub Module \e[101m${INPUT}${R0} is not Available."
fi
        LOOP=0
        command=""

  elif [[ ${command} == "show" ]]
     then
        echo -e "${r0SIGN} Argument required\n"
        echo -e "${g0SIGN} Valid parameters for the \"show\" command are: modules, info, plugins, options"
        command=""

  elif [[ ${command} == "show"* ]]
     then
        INPUT="${command#show }"
  if [[ $INPUT == "modules" ]]
   then
      moduleCOMMANDS
      command=""

  elif [[ $INPUT == "info" ]]
   then
      infoCOMMANDS
      command=""

  elif [[ $INPUT == "plugins" ]]
   then
      pluginCOMMANDS
      command=""

  elif [[ $INPUT == "options" ]]
   then
      optionCOMMANDS
      command=""

  elif [[ $INPUT == "-h" || $INPUT == "--help" || $INPUT == "help" ]]
    then
       echo -e "${g0SIGN} Valid parameters for the \"show\" command are: modules, info, plugins, options"
       command=""

   else
     echo -e "${r0SIGN} Invalid parameter \"${INPUT}\", use "'"show -h"'" for more information. "
     command=""
  fi

  elif [[ ${command} == "q" ]]
     then
        clear
        exit 0
        command=""

  elif [[ ${command} == "clear" ]]
     then
        clear
        command=""

  elif [[ ${command} == "history" ]]
      then
         showHISTORY
         command=""

  elif [[ ${command} == *""* ]]
     then
        ignoreCOMMAND command
  if [[ ${#command} -gt 0 ]]
   then
#     echo -e "\e[94m(\e[0mexec\e[94m)\e[0m: ${command}"
     $command 2>/dev/null
 if [[ $? == 0 ]]
     then
       command=""
     else
       :
  fi
fi
  fi
}

extarnalCMD() {
  if [[ ${input} == "?" || ${input} == "help" ]]
   then
       helpCOMMANDS

   elif [[ ${input} == "back" ]]
      then
while true
do
         readCOMMAND
done
elif [[ ${input} == "banner" ]]
      then
         theHEADER

elif [[ ${input} == "info" ]]
     then
        aboutMOFULES
        echo -e "
Name: $NAME
Module: $MODE
Internet Required: $NET

Description:
  $INFO
"
input=""

elif [[ ${input} == "exit" ]]
      then
         echo -e "${g0SIGN} Existing psfconsole..."
         exit 0

elif [[ ${input} == "q" ]]
      then
         clear
         exit 0

elif [[ ${input} == "clear" ]]
      then
         clear

  fi
}


# <<<--- Reading Section ! --->>>

readCONFIGURE () {
  if [[ ${command} == "use with:phish/otpweb/handler" ]]
  then
     NAME=otpweb
     MODE=withPHISH/OTPWEB
     NET=yes
     echo -e "${b0SIGN} Using configured with:phish/otpweb mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mwebpage/phish/otpweb\e[0m) > ' input
     fi
     BUNDLE()
{
     readINPUT "list1-m1" "31" "withPHISH/OTPWEB/otpweb"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     BUNDLE
     else
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

  elif [[ ${command} == "use with:phish/notpweb/handler" ]]
  then
     NAME=notpweb
     MODE=withPHISH/NOTPWEB
     NET=yes
     echo -e "${b0SIGN} Using configured with:phish/notpweb mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mwebpage/phish/notpweb\e[0m) > ' input
     fi
     BUNDLE()
{
     readINPUT "list2-m1" "31" "withPHISH/NOTPWEB/notpweb"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     BUNDLE
     else
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:phish/gpsweb/handler" ]]
  then
     NAME=gpsweb
     MODE=withPHISH/GPSWEB
     NET=yes
     echo -e "${b0SIGN} Using configured with:phish/gpsweb mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mwebpage/phish/gpsweb\e[0m) > ' input
     fi
     BUNDLE()
{
     readINPUT "list3-m1" "5" "withPHISH/GPSWEB/gpsweb"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     BUNDLE
     else
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:phish/camweb/handler" ]]
  then
     NAME=camweb
     MODE=withPHISH/CAMWEB
     NET=yes
     echo -e "${b0SIGN} Using configured with:phish/camweb mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mwebpage/phish/camweb\e[0m) > ' input
     fi
     BUNDLE()
{
     readINPUT "list4-m1" "5" "withPHISH/CAMWEB/camweb"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     BUNDLE
     else
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:phish/micweb/handler" ]]
  then
     NAME=micweb
     MODE=withPHISH/MICWEB
     NET=yes
     echo -e "${b0SIGN} Using configured with:phish/micweb mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mwebpage/phish/micweb\e[0m) > ' input
     fi
     BUNDLE()
{
     readINPUT "list5-m1" "2" "withPHISH/MICWEB/micweb"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     BUNDLE
     else
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:bomber/callnsms/handler" ]]
  then
     NAME=callnsms
     MODE=withBOMBER/CALLNSMS
     NET=yes
     echo -e "${b0SIGN} Using configured with:bomber/callnsms mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mprogram/bomber/callnsms\e[0m) > ' input
     fi
     BUNDLE()
{
     if [[ $input == "list" ]]
     then
     echo -e "\n${C4}(${R0}01${C4})${R0} Call & Sms Bombing\n${C4}(${R0}02${C4})${R0} Sms Sender\n"
     elif [[ ${input} == "1" ]]
     then
        input=""
case $(dpkg --print-architecture) in
    aarch64)
        if [[ ! $__return__ == 105 ]];then
        $CWD/programs/withBOMBER/CALLNSMS/callnsms.aarch64
        else
       cd $TMPDIR || exit 1
       curl -sLO ${RAWLINK}/programs/withBOMBER/CALLNSMS/callnsms.aarch64 |
       printf "${b0SIGN} Downloading Program...   \r"
       chmod +x callnsms.aarch64
       ./callnsms.aarch64
       fi
        ;;
    arm*)
        findOS=$(setOS 'arm' 'arm64')
        findOS=$(printf ${findOS[@]})
        if [[ ! $__return__ == 105 ]];then
        $CWD/programs/withBOMBER/CALLNSMS/callnsms.$findOS
        else
       cd $TMPDIR || exit 1
       curl -sLO ${RAWLINK}/programs/withBOMBER/CALLNSMS/callnsms.$findOS |
       printf "${b0SIGN} Downloading Program...   \r"
       chmod +x callnsms.$findOS
       ./callnsms.$findOS
       fi
        ;;
    amd*)
        if [[ ! $__return__ == 105 ]];then
        $CWD/programs/withBOMBER/CALLNSMS/callnsms.amd64
        else
       cd $TMPDIR
       curl -sLO ${RAWLINK}/programs/withBOMBER/CALLNSMS/callnsms.amd64 |
       printf "${b0SIGN} Downloading Program...   \r"
       chmod +x callnsms.amd64
       ./callnsms.amd64
       fi
        ;;
esac

      elif [[ ${input} == "2" ]]
      then
        bash $CWD/programs/withBOMBER/SMS/sms
       fi
     theERROR
     extarnalCMD
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     BUNDLE
     else
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:lookup/user/handler" ]]
  then
     NAME=user
     MODE=withLOOKUP/USER
     NET=yes
     echo -e "${b0SIGN} Using configured with:lookup/user mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mprogram/lookup/user\e[0m) > ' input
     fi
     BUNDLE()
{
readINPUT "list1-m3" "3" "withLOOKUP/USER/user"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     BUNDLE
     else
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:lookup/number/handler" ]]
  then
     NAME=number
     MODE=withLOOKUP/NUMBER
     NET=yes
     echo -e "${b0SIGN} Using configured with:lookup/number mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mprogram/lookup/number\e[0m) > ' input
     fi
     BUNDLE()
{
readINPUTS "run" "source" "withLOOKUP/NUMBER/number"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     readLIST "list2-m3"
     BUNDLE
     else
     readLIST "list2-m3"
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:remote/payload/handler" ]]
  then
     NAME=payload
     MODE=withREMOTE/PAYLOAD
     NET=not
     echo -e "${b0SIGN} Using configured with:remote/payload mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mprogram/remote/payload\e[0m) > ' input
     fi
     BUNDLE()
{
     readINPUT "list1-m4" "9" "withREMOTE/PAYLOAD/payload"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     BUNDLE
     else
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:brute/social/handler" ]]
  then
     NAME=social
     MODE=withBRUTE/SOCIAL
     NET=yes
     echo -e "${b0SIGN} Using configured with:brute/social mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mprogram/brute/social\e[0m) > ' input
     fi
     BUNDLE()
{
     readINPUTS "1" "python3" "withBRUTE/SOCIAL/facebook.py"
     readINPUTS "2" "python3" "withBRUTE/SOCIAL/instagram.py"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     readLIST "list1-m5"
     BUNDLE
     else
     readLIST "list1-m5"
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:brute/hashes/handler" ]]
  then
     NAME=hashes
     MODE=withBRUTE/HASHES
     NET=yes
     echo -e "${b0SIGN} Using configured with:brute/hashes mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mprogram/brute/hashes\e[0m) > ' input
     fi
     BUNDLE()
{
     readINPUTS "1" "python3" "withBRUTE/HASHES/md5.brute.py"
     readINPUTS "2" "python3" "withBRUTE/HASHES/sha1.brute.py"
     readINPUTS "3" "python3" "withBRUTE/HASHES/sha224.brute.py"
     readINPUTS "4" "python3" "withBRUTE/HASHES/sha256.brute.py"
     readINPUTS "5" "python3" "withBRUTE/HASHES/sha512.brute.py"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     readLIST "list2-m5"
     BUNDLE
     else
     readLIST "list2-m5"
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:attack/ddos/handler" ]]
  then
     NAME=ddos
     MODE=withATTACK/DDOS
     NET=yes
     echo -e "${b0SIGN} Using configured with:attack/ddos mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mprogram/attack/ddos\e[0m) > ' input
     fi
     BUNDLE()
{
     readINPUTS "1" "source" "withATTACK/SITEDDOS/start"
     readINPUTS "2" "python2" "withATTACK/IPDDOS/ddos.py"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     readLIST "list1-m6"
     BUNDLE
     else
     readLIST "list1-m6"
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:secure/hashes/handler" ]]
  then
     NAME=hashes
     MODE=withSECURE/HASHES
     NET=not
     echo -e "${b0SIGN} Using configured with:secure/hashes mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mprogram/secure/hashes\e[0m) > ' input
     fi
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     readINPUT "list1-m7" "10" "withSECURE/HASHES/hashes"
     else
     readINPUT "list1-m7" "10" "withSECURE/HASHES/hashes"
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:secure/passwd/handler" ]]
  then
     NAME=passwd
     MODE=withSECURE/PASSWD
     NET=not
     echo -e "${b0SIGN} Using configured with:secure/passwd mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mprogram/secure/passwd\e[0m) > ' input
     fi
     BUNDLE()
{
     readINPUT "list2-m7" "8" "withSECURE/PASSWD/passwd"
}
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     BUNDLE
     else
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done

elif [[ ${command} == "use with:secure/binary/handler" ]]
  then
     NAME=binary
     MODE=withSECURE/BINARY
     NET=not
     echo -e "${b0SIGN} Using configured with:secure/binary mode"
     while true
     do
     if [[ ! ${FALSE} == "false" ]]
     then
     read -r -p $'\e[4mpsf\e[0m use(\e[91mprogram/secure/binary\e[0m) > ' input
     fi
     BUNDLE()
     {
       readLIST "list3-m7"
       readINPUTS "run" "source" "withSECURE/BINARY/run"
     }
     command=""
     if [[ ! ${FALSE} == "false" ]]
     then
     BUNDLE
     else
     BUNDLE
     exit 0
     fi
     cmdFALSE
     done
 fi
}


# <<<--- Main Menu ! --->>>

readCOMMAND() {
interrupt
while true
do
if [[ ! ${FALSE} == "false" ]]
then
  psf
  getCOMMANDS
else
  break & readCONFIGURE
  cmdFALSE
fi
if [[ ${TRUE} == "true" ]]
then
  break & readCONFIGURE
fi
input=""
theERROR
done
}

sudoPERM
readCOMMAND

# <<<--- End --->>>

