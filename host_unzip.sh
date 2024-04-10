id=$1
token=$2
dir=$3
TEMP_FILENAME=ITN_$dir.zip

exec 2> error 1> log
echo "$(hostname)"
if ! curl -H "Authorization: Bearer $token" https://www.googleapis.com/drive/v3/files/$id?alt=media -o $TEMP_FILENAME; then
    
    echo "CURL failed"
    exit 1
fi   
if ! mkdir $dir; then
    # rm -r $dir
    # mkdir $dir
    echo "pass"
fi
echo "Unzipping to $dir. Hold tight, this may take a while!"

# n_files=$(unzip -l tmp.zip | wc -l)
# if ! unzip -o tmp.zip -d "$dir" | pv -l -s "$n_files" > /dev/null ; then
if ! unzip -q -o $TEMP_FILENAME -d "$dir"; then 
    echo "not a zip file"
    echo "curl -H "Authorization: Bearer $token" https://www.googleapis.com/drive/v3/files/$id?alt=media -o $TEMP_FILENAME"
    cat $TEMP_FILENAME
    exit 1
fi
rm -rf $TEMP_FILENAME
echo "unzip completed. tar folder"
if ! tar czf "$dir.tar.gz" "$dir" ; then
    echo "failed to tar"
    exit 1
fi
echo "unzip-zip completed!!"