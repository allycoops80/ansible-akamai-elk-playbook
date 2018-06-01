#!/bin/bash
BUCKETDIR="s3://akamai-lds-ftp-ldslogss3bucket-ydfvjkr96ig/"
BUCKETDIR+="$(date --date=yesterday +"%Y/%m/%d/")"
echo $BUCKETDIR
aws s3 ls s3://akamai-lds-ftp-ldslogss3bucket-ydfvjkr96ig/gatewayadvs_705962/"$(date --date=yesterday +"%Y/%m/")" | grep "$(date --date=yesterday +"%Y%m%d")" | awk '{print $4}' >filelist

while read p; do
    echo $p
    aws s3 cp s3://akamai-lds-ftp-ldslogss3bucket-ydfvjkr96ig/gatewayadvs_705962/"$(date --date=yesterday +"%Y/%m")"/$p /mnt/logs
    gunzip /mnt/logs/$p
done <filelist


aws s3 ls s3://akamai-lds-ftp-ldslogss3bucket-ydfvjkr96ig/mobile_ds_skyscanner_net_115834/"$(date --date=yesterday +"%Y/%m/")" | grep "$(date --date=yesterday +"%Y%m%d")" | awk '{print $4}' >filelist

while read p; do
    echo $p
    aws s3 cp s3://akamai-lds-ftp-ldslogss3bucket-ydfvjkr96ig/mobile_ds_skyscanner_net_115834/"$(date --date=yesterday +"%Y/%m")"/$p /mnt/logs
    gunzip /mnt/logs/$p
done <filelist
