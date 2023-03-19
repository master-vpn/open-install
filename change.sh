#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
clear
echo -e ""
echo -e "**************************************"
echo -e "             สคริปโดยmaster-vpn"​
echo -e ""
echo -e "     [1]  เปลี่ยนพอร์ต Stunnel4"
echo -e "     [2]  เปลี่ยนพอร์ต OpenVPN"
echo -e "     [3]  เปลี่ยนพอร์ต Squid"
echo -e "     [x]  ออก"
echo -e "**************************************"
echo -e ""
read -p "    โปรดเลือกออปชั่นที่ต้องการ [1-3 หรือ x] :  " port
echo -e ""
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-squid
;;
x)
clear
menu
;;
*)
echo "โปรดใส่คำสั่งให้ถูกต้อง"
;;
esac
