# SUID-Binary-Checker-for-Linux-PrivEsc

![SUID](https://user-images.githubusercontent.com/79696910/233857553-5ecbcd6c-9e95-4553-9dd4-2daaac3196b5.png)

This script takes all the suid binaries running in the target system and checks against suid binaries listed on GTFOBins (https://gtfobins.github.io/#+suid) to escalate privileges in linux/unix environment.

The PURPOSE of creating this script is to save time by automatically finding the exploitable SUID binaries without having to manually go through them in the target system. 

This can be used by beginners who are not so sure of which SUID binary to use when trying to perform Linux Privilege Escalation using SUID binaries in CTF Challenges or while pentesting a linux/unix environment.

NOTE : The file (gtfo-binaries.txt) containing all the exploitable SUID binaries on GTFOBins needs to be downloaded to run with this script to get the desired results.
