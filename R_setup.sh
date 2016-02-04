#!/bin/bash

if [[ "${CLUSTER}" == "1.0" ]]; then
	R_HOME=/export/R-3.0.2
	PATH=${R_HOME}/bin:${PATH}
	export R_HOME PATH

elif [[ "${CLUSTER}" == "2.0" ]]; then
	export R_HOME=/act/R-3.2.1
	export PATH=${R_HOME}/bin:${PATH}

else
	echo "R_setup.sh: -- ERROR -- Unable to use CLUSTER: '${CLUSTER}' value to determine location of R"

fi