for file in $*
do
  cut -d , -f 2 $file | sort | uniq
done
