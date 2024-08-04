#!/bin/bash
cd ~ || exit
if [ $# -ne 1 ] ; then
  echo "Usage: $0 host"
  exit
fi
N="${1}"
echo "checking $N"
ping -c 3 -i 0.1 "${N}" >& /dev/null || exit
CMD="gkrellm --server $N"
pgrep --full "$CMD" >& /dev/null
RC=$?
if [ $RC -eq 0 ] ; then
  echo "gkrellm is already running for host $N"
else
  echo "$CMD"
  $CMD >& /dev/null &
fi
