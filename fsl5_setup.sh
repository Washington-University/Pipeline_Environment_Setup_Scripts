#!/bin/bash

if [[ "${CLUSTER}" == "1.0" ]]; then
	FSLDIR=/export/fsl-5.0.6
	source ${FSLDIR}/etc/fslconf/fsl.sh
	PATH=${FSLDIR}/bin:${PATH}
	#LD_LIBRARY_PATH=${FSLDIR}/lib::${LD_LIBRARY_PATH}
	export FSLDIR PATH LD_LIBRARY_PATH

elif [[ "${CLUSTER}" == "2.0" ]]; then

	export FSLDIR=${HOME}/export/fsl-5.0.6-20150401
	source ${FSLDIR}/etc/fslconf/fsl.sh
	export PATH=${FSLDIR}/bin:${PATH}
	export LD_LIBRARY_PATH=${FSLDIR}/lib:${LD_LIBRARY_PATH}

else
	echo "fsl5_setup.sh: -- ERROR -- Unable to use CLUSTER: '${CLUSTER}' value to determine location of FSL"

fi
