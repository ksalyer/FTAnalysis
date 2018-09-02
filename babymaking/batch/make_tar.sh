#!/usr/bin/env bash

echo "Did you do 'make opt' instead of 'make'? It will be much faster"

final_dir="inputs"
files="
package.tar.xz
main.exe
liblooperBatch.so
CORE
LinkDef_out_rdict.pcm
goodRunList
"

mkdir -p $final_dir
# tar -cz --exclude='CORE/data' --exclude='*.cc' --exclude='*.h' --exclude='*.C' --exclude '*.cxx' --exclude-vcs -f $files
XZ_OPT=-9 tar -Jc \
    --exclude='CORE/data' \
    --exclude='CORE/CMS3_CORE*' \
    --exclude='CORE/Tools/dorky' \
    --exclude='CORE/Tools/MT2' \
    --exclude='CORE/Tools/classfiles' \
    --exclude='*run2_50ns*' \
    --exclude='*AK8PF*.txt' \
    --exclude='*UncertaintySources*txt' \
    --exclude='*Summer16_23Sep2016*V3_*txt' \
    --exclude='*PFPuppi*.txt' \
    --exclude='*.cc' \
    --exclude='*.h' \
    --exclude='*.C' \
    --exclude '*.cxx' \
    --exclude-vcs \
    -f $files
ls -lh package.tar.xz
mv package.tar.xz  $final_dir
echo "I put stuff into $final_dir!"

