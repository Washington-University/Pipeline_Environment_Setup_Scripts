#!/bin/bash

if [[ "${CLUSTER}" == "1.0" ]]; then
    PACKAGES_DIR=/export/freesurfer-5.3-HCP

    if [ -z "$FSLDIR" ]; then
	source /home/HCPpipeline/SCRIPTS/fsl5_setup.sh
    fi
    source ${PACKAGES_DIR}/SetUpFreeSurfer.sh
    QA_SCRIPTS=$FREESURFER_HOME/QAtools
    RECON_CHECKER_SCRIPTS=$QA_SCRIPTS/data_checker
    PATH=$RECON_CHECKER_SCRIPTS:$QA_SCRIPTS:$PATH
    export PATH

elif
    PACKAGES_DIR=/act/freesurfer-5.3.0-HCP

    if [ -z "$FSLDIR" ]; then
	source /home/HCPpipeline/SCRIPTS/fsl5_setup.sh
    fi
    source ${PACKAGES_DIR}/SetUpFreeSurfer.sh
    QA_SCRIPTS=$FREESURFER_HOME/QAtools
    RECON_CHECKER_SCRIPTS=$QA_SCRIPTS/data_checker
    PATH=$RECON_CHECKER_SCRIPTS:$QA_SCRIPTS:$PATH
    export PATH
    
else
    echo "freesurfer53_setup.sh: -- ERROR -- Unable to CLUSTER: '${CLUSTER}' value to determine location of FreeSurfer 5.3 HCP"

fi

