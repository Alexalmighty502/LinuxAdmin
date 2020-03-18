#before running please install network-manager by typing sudo apt install network-manager
hostname -I >netstats.txt #ip address
grep 'nameserver' /etc/resolv.conf >>netstats.txt #dns server
sudo ss -tul >>netstats.txt #show active and listening ports
nmcli device status >>netstats.txt #shows internet device information
echo ---IP address---
hostname -I
echo ---DNS Server---
grep 'nameserver' /etc/resolv.conf
echo ---Active and Listening ports---
sudo ss -tul
echo ---Internet Device Status---
nmcli device status

FILE=netstats.txt
NAME=${FILE%.*}
EXT=${FILE#*.} 
DATE=`date +%d-%m-%y`         
NEWFILE=${NAME}_${DATE}.${EXT}
mv netstats.txt $NEWFILE   