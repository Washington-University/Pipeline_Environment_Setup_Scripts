#!/bin/bash


if [[ "${CLUSTER}" == "1.0" ]]; then
    EPD_PYTHON_HOME=/export/epd-7.3.2
    PATH=${EPD_PYTHON_HOME}/bin:${PATH}
    export PATH

elif [[ "${CLUSTER}" == "2.0" ]] ; then
    EPD_PYTHON_HOME=${HOME}/export/epd-7.3.2
    PATH=${EPD_PYTHON_HOME}/bin:${PATH}
    export PATH
    
else
    echo "epd-python_setup.sh: -- ERROR -- Unable to use CLUSTER: '${CLUSTER}' value to determine location of EPD 7.3.2"

fi

