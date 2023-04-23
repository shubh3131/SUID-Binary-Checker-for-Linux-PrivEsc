# SUID-Binary-Checker-for-Linux-PrivEsc

![maxresdefault](https://user-images.githubusercontent.com/79696910/233857016-2ce414a8-9118-4165-8c17-6ac4df7e8d99.jpg) 
Takes all the suid binaries running in the target system and checks against suid binaries listed on GTFOBins (https://gtfobins.github.io/#+suid) to escalate privileges in linux/unix environment.

The PURPOSE of creating this script is to save time by automatically finding the exploitable SUID binaries without having to manually go through them in the target system. 

This can be used by beginners who are not so sure of which SUID binary to use when trying to perform Linux Privilege Escalation using SUID binaries in CTF Challenges or while pentesting a linux/unix environment.

NOTE : The file (gtfo-binaries.txt) containing all the exploitable SUID binaries on GTFOBins needs to be downloaded to run with this script to get the desired results.
