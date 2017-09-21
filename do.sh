#!/bin/bash

make -j 12 || return $?

MAXEVT=-1
OUTDIR=output/
LOGDIR=logs/
mkdir -p ${OUTDIR}
mkdir -p ${LOGDIR}

#most recent run2016H and re-reco
# I am not sure exactly what skim is on 2016, so run on the unskimmed babies
INDIR=../QCDskim/output/
declare -a Samples=(data_Run2016B data_Run2016C data_Run2016D data_Run2016E data_Run2016F data_Run2016G data_Run2016H)

for SAMPLE in ${Samples[@]}; do
    eval "nohup nice -n 10 ./QCDcheck.exe ${INDIR} ${SAMPLE} ${OUTDIR} ${MAXEVT} >& ${LOGDIR}/log_${SAMPLE}.txt &"
done