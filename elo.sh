#!/bin/sh

username="pmazurek@"
serwer_adres="diablo.kcir.pwr.edu.pl"
new_dir_name="nazwa"
tar_file="$new_dir_name"
tar_name="moj.tar"
tar_path="/home/pmazurek/$tar_name"

ssh $username$serwer_adres << EOF
if [ -d "$new_dir_name" ] 
then 
	rm -r $new_dir_name 
fi

mkdir $new_dir_name

if [ -f "$tar_name" ] 
then 
	rm -rf $tar_name 
fi

tar -cvf $tar_name $tar_file

rm -rf $new_dir_name
EOF

scp "$username$serwer_adres:$tar_path" .

tar_date=$(date -r $tar_name +"%d_%m_%Y")
filename="${tar_name%.*}"
extension="${tar_name#*.}"

mv $tar_name $filename$tar_date.$extension
