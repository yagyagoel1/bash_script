#!/bin/bash

logfile=job_results.log

/usr/bin/echo "the script ran at the following time : $(/usr/bin/date)" > $logfile
echo "/usr/bin/echo 'The scheduled command ran at $(/usr/bin/date)' > $logfile" | at 12:12


