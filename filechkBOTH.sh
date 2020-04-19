#!/bin/bash
echo "Please type the absolute route to the folder/file you want to check."
read filenew
#reads the user input and sets it as a variable
touch /tmp/dir1
touch /tmp/dir2
#creates 2 temporary files for later use
tar -cf - $filenew | md5sum > /tmp/dir1
#takes the md5sum's hash and saves it to prev touched file using tar to allow for folder support
echo "will you be comparing this file/folder to a saved hash or a uncompressed backup? Use hash or backup as answers."
#asks the user what hes checking either a backup or a file with a saved hash
read fileold
#reads the input
if [ $fileold == hash ]; then
#if the user answered with hash then....
	echo "Please type the absolute route to the Hash file"
#asks for the hash's location
	read hash
#reads it
	diff "/tmp/dir1" "$hash"
#compares the created hash file with the older premade hash file if the hashes are the same nothing happens if its new it notifies the user
elif [ $fileold == backup ]; then
#if the user answered with backup
	echo "Please type the absolute route to the backup file."
#asks the user for the backup file
	read directory
#reads the given directory 
	tar -cf - $directory | md5sum > /tmp/dir2
#takes the md5sum's hash and saves it to prev touched file using tar to allow for folder support
	diff  "/tmp/dir1" "/tmp/dir2"
#compares the two hashes if the hashes are the same nothing happens if its new it notifies the user
else
	echo "Please use hash or backup!"
fi
rm /tmp/dir1
rm /tmp/dir2
#while this asks for user imput to compare files/folders it could easily be made a cron job by replacing the user given variables with what file/directory to check