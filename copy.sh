host=$1
dir=$2

echo "kaye@$host.robots.ox.ac.uk:~/$dir"

if ! scp -q -o LogLevel=QUIET -r kaye@"$host".robots.ox.ac.uk:~/$dir kaye@vggdebug8:/scratch/local/ssd/kaye/$dir; then
    echo "scp failed!!"
    exit 1
fi

subject="Job ($dir) complete"
body="File downloaded and unzipped!"
echo "$body" | mail -s "$subject" benkaye001@gmail.com