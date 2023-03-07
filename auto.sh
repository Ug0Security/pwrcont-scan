cat iplist | while read line
do
echo $line
echo ""
bash scna.sh $line
echo ""
echo ""
done
