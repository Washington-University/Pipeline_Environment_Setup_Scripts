#!/bin/bash

FSLDIR=/export/fsl-5.0.6
source ${FSLDIR}/etc/fslconf/fsl.sh
PATH=${FSLDIR}/bin:${PATH}
#LD_LIBRARY_PATH=${FSLDIR}/lib::${LD_LIBRARY_PATH}
export FSLDIR PATH LD_LIBRARY_PATH
