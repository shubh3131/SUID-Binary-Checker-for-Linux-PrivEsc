#!/bin/bash

# Author Name: shubh3131
# Date Created: 23/04/2023
# Last Modified: 24/04/2023

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



# Checking if the suids.txt file exists containing all the suid binaries; if not create a file, suids.txt with all the suid binaries present in the target system.

if [ ! -f suids.txt ];then
        find / -type f -perm -u=s -ls 2>/dev/null >> suids.txt
else
        echo "The suids.txt file will be used to check for useful suid binaries to escalate privileges"
        echo
fi


 
# Checking if programs.txt file exists, which contains a list of binaries (in the sanitised form)  which can be compared against the list of exploitable suid binaries available on GTFObins.

if [ -f programs.txt ];then
        echo
else
        cat suids.txt | tr -s " " | cut -d " " -f 12 | awk -F '/' '{print $NF}' >> programs.txt
fi


# Creating arrays using the files to iterate on individual suid binaries.

readarray -t target_suids < programs.txt
readarray -t gtfo_suids < gtfo-binaries.txt



# Declaring an empty array which will hold all the exploitable SUID binaries which can be used to escalate privileges on the target linux system.
 
declare -a exploitable_suids=()
index=0



# Comparing the list of exploitable suid binaries available on GTFObins against the suid binaries present on the target system and putting the matched binaries into the array.

for target in "${target_suids[@]}"; do
        if echo "${gtfo_suids[@]}" | grep -qw "$target"; then
                exploitable_suids[index]="$target"
                index=index+1
        fi
done


# Checking if the array is empty or not to see if we found any exploitable suid binaries using which we can escalate our privileges.


if [ "${#exploitable_suids[@]}" -eq 0 ]; then
        echo "There are no exploitable suid binaries"
else
        echo "The suid binaries which can be used to escalate privileges on the target system are: "
        echo
        for suid in "${exploitable_suids[@]}";do
                echo "$suid"
                echo
        done
fi



exit 0
