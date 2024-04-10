host=$1
dir=$2
drive_type=ssd
usr=kaye
dsetpath=/scratch/local/$drive_type/$kaye
devhost=vggdebug8
ext=tar.gz
file=$dir.$ext
echo "attempting scp transfer"
if ! scp -q -o LogLevel=QUIET -r $usr@"$host".robots.ox.ac.uk:~/$file $usr@$devhost:$dsetpath/tmp/$file; then
    echo "scp failed!!"
    exit 1
fi
echo "transfer complete! un-gz"
# if ! tar xf $dsetpath/tmp/$file -C $dsetpath/$dir/tmp; then 
if ! gzip -d $dsetpath/tmp/$file; then
    echo "dev side unzip failed!"
    exit 1
fi