#!/usr/local/bin/zsh

echo 'type of from_file extension'
echo 'from_filename.(extension)'
read from_extension
echo 'type of to_file extension'
echo 'filename.(extension)'
read to_extension

for i in `ls *.$from_extension`
do
    filename=`basename $i .$from_extension`
    echo $filename
    convert $filename.$from_extension $filename.$to_extension
done
