#!/bin/bash

###Skript tänase ülesande automatiseerimiseks###

echo "02.12.2021"

mkdir praks1
cd praks1

touch fail{1..12}
ls -l >> list.txt

echo "Tanel Märjama, Vto20" >> fail1
mv fail1 minu_andmed.txt
echo "Operatsioonisüsteemide omadusi, põhifunktsionaalsusi lähtudes kasutusvaldkondadest" >> fail9
mv fail9 aine_andmed.txt

echo "02.12.2020 kolmapäev" >> fail2
mv fail2 date_andmed.txt

echo "---2_list---" >> list.txt
ls -l >> list.txt

ssh user@192.168.16.164 'mkdir /home/user/vto20/tanel_märjama'


mv fail{3..8} /home/user/

echo "---3_list---" >> list.txt
ls -l >> list.txt 

mkdir allalaadimised
cd allalaadimised
wget http://anna.ikt.khk.ee/mihhail.karutin/avorgud/test.txt
cd ../

mkdir backup
cp minu_andmed.txt date_andmed.txt aine_andmed.txt list.txt fail{10..12} /home/user/praks1/backup/ 
cp /home/user/praks1/allalaadimised/test.txt /home/user/praks1/backup/
cp /home/user/fail{3..8} /home/user/praks1/backup/

cd backup
echo "---backup_list---" >> list.txt
ls -l >> list.txt
cd ../

ip a >> ip.txt
scp ip.txt user@192.168.16.164:/home/user/vto20/tanel_märjama

scp user@192.168.16.164:/home/user/vto20/a.txt /home/user/
echo "02.12.2020 Tanel Märjama" >> a.txt
mv a.txt a_Tanel_Märjama.txt
scp a_Tanel_Märjama.txt user@192.168.16.164:/home/user/vto20/tanel_märjama

mv ./allalaadimised/test.txt /home/user/

rm -r allalaadimised aine_andmed.txt date_andmed.txt minu_andmed.txt list.txt fail{10..12}

echo "---4_list---" >> ./backup/list.txt
ls -l >> ./backup/list.txt

scp ./backup/list.txt user@192.168.16.164:/home/user/vto20/tanel_märjama

echo "Tanel Märjama 02.12.2020" >> ../test.txt
scp ../test.txt user@192.168.16.164:/home/user/vto20/tanel_märjama



