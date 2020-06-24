# usage:  ./stage.sh N
# effect: causes files for 0-*.tf, 1-*.tf, 2-*.tf, ..., N-*.tf to be enabled, and disabled for >N

for x in *.tf ; do mv $x $x.disabled ; done

for x in `seq 0 $1` ; do
  for y in $x-*.tf.disabled ; do
    mv $y ${y%%.disabled}
  done
done

echo Now enabled:
ls *.tf | cat
