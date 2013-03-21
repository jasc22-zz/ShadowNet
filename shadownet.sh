#bin/bash
#ShadowNet is a bash script that displays netstat information in an easily understandable format using Shadowserver's whois service.
#Usage: sh shadow.sh or ./shadow.sh
netstat -t -u -n | awk '{print $5}' | cut -d: -f1 | uniq -c | awk '{print $2}' | tr -d 'Address' | tr -d 'v)' | tr -s '\n' | awk '!/127.0.0.1/' > tmp.txt
echo "end" >> tmp.txt
sed '1s/^/begin origin /' tmp.txt > outbound.txt
netcat asn.shadowserver.org 43 < outbound.txt > whois.txt
rm tmp.txt
rm outbound.txt
cat whois.txt
