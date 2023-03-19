#!/bin/bash
echo ''
clear
echo '............................................................'
echo ''
echo '                     OPENVPN MINI SCRIPT                    '
echo ' ..........................................................'
sleep 5
clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
clear
echo -e "${green} คุณได้รับอนุญาตให้ใช้งานได้...${NC}"
sleep 1
clear
echo '============================================='
echo '                โปรดรอสักครู่... '
echo '       ระบบจะทำการอัพเดทและอัพเกรดเซิฟเวอร์'
echo '============================================='
sleep 5
apt update && apt upgrade -y
clear
echo '============================================='
echo '                 เรียบร้อยแล้ว '
echo '============================================='
sleep 5
clear
echo '============================================='
echo '         ระบบกำลังจะดำเนินการลงสคริปให้กับท่าน '
echo '============================================='
sleep 5
mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
clear
echo '============================================='
echo "      โปรดใส่โดเมนของท่าน, หากไม่มีกด ENTER "
echo '============================================='
read -p "โฮสต์ / โดเมน​ : " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
clear
echo '============================================='
echo '        กำลังติดตั้ง SSH & OPENVPN '
echo '============================================='
sleep 3
wget https://raw.githubusercontent.com/master-vpn/open-install/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
echo '============================================='
echo '        กรุณารอสักครู่....! '
echo '============================================='
rm -f /root/ssh-vpn.sh
rm -f /root/ins-vt.sh
history -c
echo "1.2" > /home/ver
clear
#cert 
cert
echo " echo ' WELCOME   ' " >> .profile
echo " echo ' AOTU MINI SCRIPT        '" >> .profile
echo " echo ' OPENVPN-INSTALL BY/master-vpn     '" >> .profile
echo '============================================='
echo "                ติดตั้งสำเร็จแล้ว"
echo '============================================='
clear
echo " "
echo "===========================-openvpn-install-=========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 80"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Bangkok (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""
echo "--------------------------สคริปโดยmaster-vpn------------------------" | tee -a log-install.txt
echo ""
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot

