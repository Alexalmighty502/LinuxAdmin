getent passwd | egrep -v '/s?bin/(nologin|shutdown|sync|halt|false)' > /tmp/usersnapshot.txt
#runs the getent command to get the entries in passwd then greps them to only show user accounts and saves to another file
usercount=$(< "/tmp/usersnapshot.txt" wc -l)
#reads how many lines(users) are in the txt doc
if [ "$usercount" -gt 2 ]
#if the user count is higher then 2 (i only have 2 users on Centos)
then
echo Usercount has increased!
else
 :
fi
mv /tmp/usersnapshot.txt /mnt/hgfs/Shared_Folder/Userlog/usersnapshot_`date +%d%b%Y@%H`.txt