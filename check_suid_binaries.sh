#!/bin/bash

# Author Name: shubh3131
# Date Created: 23/04/2023
# Last Modified: 23/04/2023

# Description:
# This script takes a file with all the suid binaries running in the target system and checks it against the list of suid binaries 
# listed on gtfobins which can be used to escalate our privileges in unix/linux environment. 
# The purpose of creating this script is to save time by automatically finding the exploitable suid binaries without having to manually
# go through them in the target system.  

# Usage:
# ./check_suid.sh

# Note: a file containing all of the exploitable suid binaries was made by the list available on gtfobins to run against this script. 


# DOWNLOAD THE 'gtfo-binaries.txt' FILE TO RUN ALONG WITH THE CODE.



# CODE STARTS HERE:

if [ ! -f suids.txt ];then
        find / -type f -perm -u=s -ls 2>/dev/null >> suids.txt
else
	echo "The suids.txt file will be used to check for useful suid binaries to escalate privileges"
	echo
fi


 
if [ -f programs.txt ];then
	echo
else
	cat suids.txt | tr -s " " | cut -d " " -f 12 | awk -F '/' '{print $NF}' >> programs.txt
fi

readarray -t target_suids < programs.txt
readarray -t gtfo_suids < gtfo-binaries.txt

echo "The suid binaries which can be used to escalate privileges on the target program are: "
echo

for target in "${target_suids[@]}"; do
        if echo "${gtfo_suids[@]}" | grep -qw "$target"; then
                echo "$target"
                echo
        fi

done


exit 0


