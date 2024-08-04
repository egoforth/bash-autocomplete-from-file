#!/bin/bash
cd /var/lib/boinc || exit
if [ $# -ne 1 ] ; then
  N="localhost"
else
  N="${1}"
fi
echo "checking $N"
ping -c 3 -i 0.1 "${N}" >& /dev/null || exit
boinccmd --host "$N" --get_host_info | egrep '(GPU|OpenCL)'

