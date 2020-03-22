cat ShortenedStaff.txt | while read name   ;   do #read the file and for every line...

echo $name #prints the user the program is working on

sudo useradd -d /home/Staff/$name -G Staff $name #adds the user with his/hers own directory as well as adding them to a group

pass="$(pwgen -s 7 1)" #uses pwgen to generate a random 7 digit password

echo $name:$pass | sudo chpasswd #sets the password with the prev created password

echo $name $pass >> stafflogin.txt #outputs the users login and password to a different file

done

cat ShortenedAdmin.txt | while read name   ;   do #read the file and for every line...
echo $name #prints the user the program is working on

sudo useradd -d /home/Admin/$name -G Admin,sudo $name #adds the user with his/hers own directory as well as adding them to both the Admin group and the wheel group for sudo access
pass="$(pwgen -s 7 1)" #uses pwgen to generate a random 7 digit password

echo $name:$pass | sudo chpasswd #sets the password with the prev created password

echo $name $pass >> adminlogin.txt #outputs the users login and password to a different file

done

cat ShortenedTemp.txt | while read name   ;   do #read the file and for every line...

echo $name #prints the user the program is working on

sudo useradd -d /home/Staff/$name -G Temp $name #adds the user with his/hers own directory as well as adding them to a group
pass="$(pwgen -s 7 1)" #uses pwgen to generate a random 7 digit password

echo $name:$pass | sudo chpasswd #sets the password with the prev created password

echo $name $pass >> templogin.txt #outputs the users login and password to a different file

done

cat ShortenedDev.txt | while read name   ;   do #read the file and for every line...
echo $name #prints the user the program is working on

sudo useradd $user -d /home/Dev/$name -G Developer $name -s /bin/csh #adds the user with his/hers own directory as well as adding them to a group while also defaulting the user to the c shell
pass="$(pwgen -s 7 1)" #uses pwgen to generate a random 7 digit password

echo $name:$pass | sudo chpasswd #sets the password with the prev created password

echo $name $pass >> devlogin.txt #outputs the users login and password to a different file

done

