#!/bin/bash

if [[ "${CLUSTER}" == "1.0" ]]; then
	R_HOME=/export/R-3.0.2
	PATH=${R_HOME}/bin:${PATH}
	export R_HOME PATH

	echo "R_setup.sh: Set up to run R from ${R_HOME}"

elif [[ "${CLUSTER}" == "2.0" ]]; then
	export R_HOME=${HOME}/R-3.0.2
	export PATH=${R_HOME}/bin:${PATH}

	echo "R_setup.sh: Set up to run R from ${R_HOME}"

else
	echo "R_setup.sh: -- ERROR -- Unable to use CLUSTER: '${CLUSTER}' value to determine location of R"

fi