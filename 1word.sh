read -e -p "Enter filename, use tab for completion: " file #asks for the file to shorten
sed 's/ //g' $file > tmp.txt #saves the given file under a temp folder with the spaces removed
cut tmp.txt -c 1-12 > "Shortened"$file #shortens the given name to 12 characters or less and saves it to a folder with the original files name with shortened before it

