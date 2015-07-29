#!/bin/bash 

script_name="SetUpHCPPipeline_PostFix.sh"
echo "${script_name}: This script must be SOURCED to correctly setup the environment prior to running"
echo "${script_name}: any of the other HCP scripts contained here."

if [ "${COMPUTE}" = "" ]
then
	echo "${script_name}: COMPUTE value unset.  Setting to the default of CHPC"
	export COMPUTE="CHPC"
fi

if [ "$COMPUTE" = "CHPC" ]
then
	echo ""
	echo "${script_name}: Setting up for processing on ${COMPUTE}"

	echo ""
	echo "${script_name}: Setting up FSL"
	export FSLDIR=/export/fsl-5.0.6-20150401
	source ${FSLDIR}/etc/fslconf/fsl.sh
	echo "${script_name}: Set up to use FSL at ${FSLDIR}"

	echo ""
	echo "${script_name}: Setting up FreeSurfer"
	export FSL_DIR="${FSLDIR}"
	export FREESURFER_HOME=/export/freesurfer-5.3-HCP
	source ${FREESURFER_HOME}/SetUpFreeSurfer.sh
	echo "${script_name}: Set up to use FreeSurfer at ${FREESURFER_HOME}"

	echo ""
	echo "${script_name}: Setting up Python"
	export EPD_PYTHON_HOME=/export/epc-7.3.2
	export PATH=${EPD_PYTHON_HOME}/bin:${PATH}
	echo "${script_name}: Set up to use EPD Python at ${EPD_PYTHON_HOME}"

	echo ""
	echo "${script_name}: Setting up Workbench (a.k.a. CARET7)"
	export CARET7DIR=/home/HCPpipeline/pipeline_tools/workbench-v1.1.1/bin_rh_linux64
	echo "${script_name}: Set up to use Workbench at ${CARET7DIR}"

	echo ""
	echo "${script_name}: Setting up HCP Pipelines"
	export HCPPIPEDIR=/home/HCPpipeline/pipeline_tools/Pipelines_dev

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

    # DiffusionHCP
	export HCPPIPEDIR_dMRI=${HCPPIPEDIR}/DiffusionPreprocessing/scripts

    # Task Analysis
	export HCPPIPEDIR_tfMRIAnalysis=${HCPPIPEDIR}/TaskfMRIAnalysis/scripts

    # ICA+FIX	
	export HCPPIPEDIR_FIX=${HCPPIPEDIR}/catalog/FIX_HCP/resources/scripts

	echo "${script_name}: Set up to use HCP Pipelines at ${HCPPIPEDIR}"

	# MSM
	#export MSMBin=/NRG/BlueArc/nrgpackages/tools.release/MSMSulc-v1.3-2014.02.10
	export MSMBin=/home/HCPpipeline/pipeline_tools/MSM-2015.01.14
	echo "${script_name}: Set up to use MSM binary at ${MSMBin}"

	# Octave
	export OCTAVE_HOME=/export/octave-3.6.3
	echo "${script_name}: Set up to use Octave at ${OCTAVE_HOME}"
else
	echo "${script_name}: Processing setup for ${COMPUTE} is currently not supported."
	echo "${script_name}: EXITING WITH NON-ZERO EXIT STATUS (UNSUCCESSFUL EXECUTION)"
	exit 1
fi



