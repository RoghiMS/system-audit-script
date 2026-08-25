# system-audit-script
A bash script that audits system users, kernel info, config files, permissions, and logs, saving results in organized text files.
A bash script designed to help system administrators collect important system information.
It extracts user accounts from /etc/passwd, finds users with /bin/bash shell, saves kernel version and architecture, finds all .
conf files in /etc, identifies the top 10 largest files in /var/log, manages file permissions, and organizes all outputs in a structured directory (~/exam_results/audit/). 
The script handles file copying, permission changes, and output redirection with proper error handling.
