read -p 'Google drive file ID: ' id
read -p 'Google OAuth drive access token: ' token
read -p 'Output dir: ' dir

# https://developers.google.com/oauthplayground/
# https://www.googleapis.com/auth/drive.readonly

# vgg-usdc-stor1
usr=kaye

dump=$(ssh $usr@vgg-download.robots.ox.ac.uk "bash -s $id $token $dir" < host_dl_and_unzip.sh | tee /dev/tty)
filehost=$(echo "$dump" | head -n 1)
sh copy.sh "$filehost" "$dir"