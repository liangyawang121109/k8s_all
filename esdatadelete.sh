#!/bin/bash

tim=`date -d -3day +%Y.%m.%d`

index=`curl -s -f  -uelastic:121109 -XGET http://es.log-mon.svc.cluster.local:9200/_cat/shards | awk 'NR>3 {print $1}' |grep $tim`

for i in $index
do
        echo $i
        curl -uelastic:121109 -XDELETE http://es.log-mon.svc.cluster.local:9200/$i
done
