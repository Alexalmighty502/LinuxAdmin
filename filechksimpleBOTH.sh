#!/bin/bash
echo "Please type the absolute route to the file you want to check."
read filenew
echo "Please type the absolute route to the old file."
read fileold
diff -qrN "$filenew" "$fileold"