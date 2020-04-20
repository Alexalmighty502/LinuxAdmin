getent passwd | egrep -v '/s?bin/(nologin|shutdown|sync|halt|false)' > /tmp/usersnapshot.txt
#runs the getent command to get the entries in passwd then greps them to only show user accounts and saves to another file
usercount=$(< "/tmp/usersnapshot.txt" wc -l)
#reads how many lines(users) are in the  txt doc
if [ "$usercount" -gt 5 ]
#if the user count is higher then 4 (i only have 4 users on Centos)
then
echo Usercount has increased!
#notifies the user that the user account increased
else
 :
# if the user count is unchanged do nothing
fi
mv /tmp/usersnapshot.txt /mnt/hgfs/Shared_Folder/Userlog/usersnapshot_`date +%d%b%Y@%H`.txt
#moves the text file and adds on the date to the end of the text files name in  day/month/year@hour format