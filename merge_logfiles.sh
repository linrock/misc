#!/bin/bash

# Merge log files with different name but same host. Delete junk logs.
for logfile in $(ls -1 *.log | tr '[:upper:]' '[:lower:]' | sed '/:80/d' | sed '/www./d' | sort -u ); do
    samehost=$(ls -1 | fgrep -i $(echo $logfile | cut -d. -f 1,2) | tr '\n' ' ')
    echo Processing $logfile
    /usr/share/awstats/tools/logresolvemerge.pl $samehost > $logfile.cleaned.log
    rm $samehost
    mv $logfile.cleaned.log $logfile
done
