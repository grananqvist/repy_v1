#!/bin/bash

# Uses repypp to build tests.
# Puts tests in $TESTDIR.

: ${1?"Usage: $0 <output directory> [classname]"}

REPYPP=../../../../seattlelib/repypp.py 
TESTDIR=$1

if [ ! -e ../${TESTDIR} ]
then
  mkdir ../${TESTDIR}
fi

if [ -z "$2" ]
then
  files=`ls [zne]_test*.py`
else
  files=`ls [zne]_test_$2*.py`
fi

# copy in included files
cp ../*.repy .
echo "Building tests..."
for f in ${files}
do
  echo ${f}
  python ${REPYPP} ${f} ../${TESTDIR}/${f}
done
echo "Done"

exit

