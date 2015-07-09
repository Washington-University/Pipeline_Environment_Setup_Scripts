#!/bin/bash

PACKAGES_DIR=/export/freesurfer-5.2

if [ -z "$FSLDIR" ]; then
  source /home/HCPpipeline/SCRIPTS/fsl5_setup.sh
fi
source ${PACKAGES_DIR}/SetUpFreeSurfer.sh
QA_SCRIPTS=$FREESURFER_HOME/QAtools
RECON_CHECKER_SCRIPTS=$QA_SCRIPTS/data_checker
PATH=$RECON_CHECKER_SCRIPTS:$QA_SCRIPTS:$PATH
export PATH

