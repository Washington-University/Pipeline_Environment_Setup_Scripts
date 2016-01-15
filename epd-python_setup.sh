#!/bin/bash

if [[ "${CLUSTER}" == "2.0" ]] ; then
    EPD_PYTHON_HOME=${HOME}/export/epd-7.3.2
else
    EPD_PYTHON_HOME=/export/epd-7.3.2
fi

PATH=${EPD_PYTHON_HOME}/bin:${PATH}
export PATH
