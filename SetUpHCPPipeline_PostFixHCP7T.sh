#!/bin/bash 

echo "SetUpHCPPipeline_PostFixHCP7T.sh: This script must be SOURCED to correctly setup the environment prior to running"
echo "SetUpHCPPipeline_PostFixHCP7T.sh: any of the other HCP scripts contained here."

if [ "${COMPUTE}" = "" ] ; then
    echo "SetUpHCPPipeline_PostFixHCP7T.sh: COMPUTE value unset.  Setting to the default of CHPC"
    export COMPUTE="CHPC"
fi

if [ "${COMPUTE}" = "CHPC" ] ; then
    echo "SetUpHCPPipeline_PostFixHCP7T.sh: Setting up for processing on ${COMPUTE}"
    
	if [ "${CLUSTER}" = "2.0" ] ; then
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Setting up for CHPC cluster ${CLUSTER}"
		
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Setting up FSL"
		export FSLDIR=${HOME}/export/fsl-5.0.9-custom-eddy
		source ${FSLDIR}/etc/fslconf/fsl.sh
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Set up to use FSL at ${FSLDIR}"
		
		# LD_LIBRARY_PATH
		# bet2 binary in FSL-5.0.9 needs newer version of libstdc++.so.6 
		# found in /act/gcc-4.7.2/lib64
		if [ -z "${LD_LIBRARY_PATH}" ] ; then
			export LD_LIBRARY_PATH=/act/gcc-4.7.2/lib64
		else
			export LD_LIBRARY_PATH=/act/gcc-4.7.2/lib64:${LD_LIBRARY_PATH}
		fi

		echo "SetUpHCPPipeline_IcaFixProcessingHCP7T: Added /act/gcc-4.7.2/lib64 to LD_LIBRARY_PATH"
		echo "SetUpHCPPipeline_IcaFixProcessingHCP7T: LD_LIBRARY_PATH: ${LD_LIBRARY_PATH}"

		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Setting up FreeSurfer"
		export FSL_DIR="${FSLDIR}"
		export FREESURFER_HOME=/act/freesurfer-5.3.0-HCP
		source ${FREESURFER_HOME}/SetUpFreeSurfer.sh
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Set up to use FreeSurfer at ${FREESURFER_HOME}"
		
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Setting up Python"
		export EPD_PYTHON_HOME=${HOME}/export/epd-7.3.2
		export PATH=${EPD_PYTHON_HOME}/bin:${PATH}
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Set up to use EPD Python at ${EPD_PYTHON_HOME}"
		
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Setting up Workbench (a.k.a. CARET7)"
		export CARET7DIR=${HOME}/pipeline_tools/workbench-v1.1.1/bin_rh_linux64
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Set up to use Workbench at ${CARET7DIR}"
		
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Setting up HCP Pipelines"
		export HCPPIPEDIR=${HOME}/pipeline_tools/Pipelines-3.16.0

		# global
		export HCPPIPEDIR_Config=${HCPPIPEDIR}/global/config
		export HCPPIPEDIR_Global=${HCPPIPEDIR}/global/scripts
		export HCPPIPEDIR_Templates=${HCPPIPEDIR}/global/templates
		
		# Structural
		export HCPPIPEDIR_PreFS=${HCPPIPEDIR}/PreFreeSurfer/scripts 
		export HCPPIPEDIR_FS=${HCPPIPEDIR}/FreeSurfer/scripts
		export HCPPIPEDIR_PostFS=${HCPPIPEDIR}/PostFreeSurfer/scripts
		
		# Functional
		export HCPPIPEDIR_fMRISurf=${HCPPIPEDIR}/fMRISurface/scripts
		export HCPPIPEDIR_fMRIVol=${HCPPIPEDIR}/fMRIVolume/scripts
		
		# Diffusion
		export HCPPIPEDIR_dMRI=${HCPPIPEDIR}/DiffusionPreprocessing/scripts
		
		# Task Analysis
		export HCPPIPEDIR_tfMRIAnalysis=${HCPPIPEDIR}/TaskfMRIAnalysis/scripts
		
		# ICA+FIX	
		#export HCPPIPEDIR_FIX=${HCPPIPEDIR}/catalog/FIX_HCP/resources/scripts
		export HCPPIPEDIR_FIX=${HCPPIPEDIR}/ICAFIX

		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Set up to use HCP Pipeline Scripts at ${HCPPIPEDIR}"

		# MSM
		export MSMBin=${NRG_PACKAGES}/tools.release/MSMSulc-v1.3-2014.02.10
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Set up to use MSM binary at ${MSMBin}"

		# ICA+FIX
		export FSL_FIXDIR=${HOME}/pipeline_tools/fix1.062
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Set up to use ICA FIX at ${FSL_FIXDIR}"

    else # unhandled value for ${CLUSTER}
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: Processing set up for cluster ${CLUSTER} is currently not supported."
		echo "SetUpHCPPipeline_PostFixHCP7T.sh: EXITING WITH NON-ZERO EXIT STATUS (UNSUCCESSFUL EXECUTION)"
		exit 1
		
    fi
	
else # unhandled value for ${COMPUTE}
    echo "SetUpHCPPipeline_PostFixHCP7T.sh: Processing set up for COMPUTE environment ${COMPUTE} is currently not supported."
    echo "SetUpHCPPipeline_PostFixHCP7T.sh: EXITING WITH NON-ZERO EXIT STATUS (UNSUCCESSFUL EXECUTION)"
    
fi
