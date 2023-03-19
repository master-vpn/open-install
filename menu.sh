#!/bin/bash
clear
echo -e "************************************************************" | lolcat
echo -e "***********************  MANAGER **************************" | lolcat
echo -e "*********************** OPEN OVPN *************************" | lolcat
echo -e "************************************************************" | lolcat
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

echo -e "* ชนิดซีพียู : $cname"
echo -e "* แกน​ : $cores"
echo -e "* ความถี่ซีพียู : $freq MHz"
echo -e "* แรม​ : $tram MB"
echo -e "* ระยะเวลาทำงานของระบบ : $up"
echo -e "* ผู้้ให้บริการ : $ISP"
echo -e "* เมือง​ : $CITY"
echo -e "* เวลา​ : $WKT"
echo -e "* วันที่ : $tnggl"
echo -e "* ไอพี​ : $IPVPS"
echo -e ""
echo -e "************************************************************" | lolcat
echo -e "* menu         : สารบัญคำสั่ง"
echo -e "************************************************************" | lolcat
echo -e "                     SSH AND OPENVPN"
echo -e "* new          : สร้างบัญชี SSH & OpenVPN"
echo -e "* renew        : ต่ออายุบัญชี SSH & OpenVPN"
echo -e "* deluser      : ลบบัญชี SSH & OpenVPN"
echo -e "* check        : แสดงบัญชีผู้ใช้งาน SSH & OpenVPN"
echo -e "* user         : แสดงบัญชี SSH & OpenVPN ทั้งหมด"
echo -e "* delete       : ลบบัญชี SSH & OpenVPN ที่หมดอายุแล้ว"
echo -e "* autokill     : ตั้งค่าการเข้าใช้งานหลายบัญชี"
echo -e "* multi        : แสดงบัญชีที่เข้าใช้งานหลายเครื่อง"
echo -e "* restart      : รีสตาร์ท  Dropbear, Squid3, OpenVPN และ SSH"
echo -e "************************************************************" | lolcat
echo -e "                    ตั้งค่าระบบ"
echo -e "* backup       : แบ็คอัพข้อมูล"
echo -e "* restore      : กู้ข้อมูล"
echo -e "* port         : แก้ไขหรือเปลี่ยนพอร์ต"
echo -e "* reboot       : รีบูตเครื่อง"
echo -e "* speedtest    : ตรวจสอบความเร็วเซิฟเวอร์"
echo -e "* info         : แสดงข้อมูลระบบ"
echo -e "* exit         : ออกจากระบบ"
echo -e "************************************************************" | lolcat
echo -e " open-install"
echo -e " Copyright © master-vpn"
echo -e ""
