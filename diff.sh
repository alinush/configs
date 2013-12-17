scriptdir=$(readlink -f $(dirname $0))
confdir=$scriptdir/conf-files

echo
echo "Configuration files in conf-files/"
echo "=================================="
ls -A $confdir

echo
echo "Diffs (yours vs. repo)"
echo "======================"
for f in `ls -A $confdir/`; do
    echo " * Diff for ~/$f and conf-files/$f"
    diff -rupN ~/$f $confdir/$f
    echo
done
