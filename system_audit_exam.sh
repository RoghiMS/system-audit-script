#!/bin/bash
#system audit

#prepare exam_results/audit directory
mkdir -p ~/exam_results/audit/    
cd ~/exam_results/audit/

#create notis file
touch notis.txt

#save current working directory
pwd > cwd.txt

#create users file
touch users.txt

#extract all username from etc/passwd
awk -F: '{print $1}' /etc/passwd > users.txt

#create bash_users.txt
touch bash_users.txt

#extract user who login
awk -F: '$7=="/bin/bash" {print $1}' /etc/passwd > bash_users.txt

#create shell_perview.txt
touch shell_perview.txt

#replacement without modifiying etc/passwd
awk -F: '$7=="/bin/bash" {gsub("/bin/bash","/usr/bin/zsh"); print; exit}' /etc/passwd > shell_preview.txt

#create sysinfo.txt
touch sysinfo.txt

#save cernel version
uname -r > sysinfo.txt
arch >> sysinfo.txt

#create group_summary.txt file
touch group_summary.txt

#save 3 up and 2 down line from etc/passwd
head -3 /etc/group > group_summary.txt
tail -2 /etc/group >> group_summary.txt

#create conf_files.txt file
touch conf_files.txt

#finad all .conf files under /etc
find /etc -name "*.conf" > conf_files.txt

#crate top_logs.txt files
touch top_logs.txt

#finde 10 largest file under var/log
find /var/log/ -type f -printf '%s %p\n' |sort -nr | head -10 >top_logs.txt

#copy hosts to hosts.bak
cp /etc/hosts hosts.bak

#set permission 600
chmod 600 hosts.bak

#create hosts_perm.txt
touch hosts_perm.txt

#saver permission
ls -l hosts.bak > hosts_perm.txt

#cleanup all .txt file
#rm *.txt


