host=###
DATE=`date +%Y-%m-%d`
TIME=`date +%H%M%S`
LOG_OK=/tmp/telnet_ok
LOG_FAIL=/tmp/telnet_fail

for port in 22 25
do
if echo quit | timeout --signal=9 2 telnet -c $host $port </dev/null 2>&1 | grep -q Escape; then
  #echo "$DATE $TIME  $port: Connected" >> $LOG_OK
  echo "$DATE $TIME  $port: Connected"
else
  #echo "$DATE $TIME $port : No Connection" >> $LOG_FAIL
  echo "$DATE $TIME  $port: No Connection"
fi
done
