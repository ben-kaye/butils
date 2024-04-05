id=$1
token=$2
dir=$3

echo "$(hostname)"
if ! curl -H "Authorization: Bearer $token" https://www.googleapis.com/drive/v3/files/$id?alt=media -o tmp.zip; then
    
    echo "CURL failed"
    exit 1
fi   
mkdir $dir
echo "Unzipping to $dir. Hold tight, this may take a while!"
if ! unzip -qq tmp.zip -d $dir; then 
    echo "not a zip file"
    echo "curl -H "Authorization: Bearer $token" https://www.googleapis.com/drive/v3/files/$id?alt=media -o tmp.zip"
    cat tmp.zip
    exit 1
fi
# rm -rf tmp.zip
# if ! zip -qq -r $dir.zip $dir; then
#     echo "failed to rezip"
#     exit 1
# fi

# assuming passing the antivirus (?)
mv tmp.zip $dir.zip