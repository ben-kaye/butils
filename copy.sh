host=$1
dir=$2
drive_type=ssd
usr=kaye
dsetpath=/scratch/local/$drive_type/$kaye
devhost=vggdebug8

echo "attempting scp transfer"
if ! scp -q -o LogLevel=QUIET -r $usr@"$host".robots.ox.ac.uk:~/$dir.zip $usr@$devhost:$dsetpath/tmp/$dir.zip; then
    echo "scp failed!!"
    exit 1
fi
if ! unzip -qq $dsetpath/tmp/$dir.zip -d $dsetpath/$dir; then 
    echo "dev side unzip failed!"
    exit 1
fi
rm -rf $dsetpath/tmp/$dir.zip