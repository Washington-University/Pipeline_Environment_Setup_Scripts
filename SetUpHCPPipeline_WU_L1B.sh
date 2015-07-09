#!/bin/bash 

SCRIPT_NAME="SetupHCPPipeline_WU_L1B.sh"

echo "${SCRIPT_NAME}: This script must be SOURCED to correctly setup the environment prior to running any of the other HCP scripts contained here"

if [ "$COMPUTE" = "" ] ; then
    echo "${SCRIPT_NAME}: COMPUTE value unset.  Setting it to default to NRG"
    export COMPUTE="NRG"
fi

if [ "$COMPUTE" = "NRG" ] ; then

    echo "${SCRIPT_NAME}: Setting up for processing on ${COMPUTE}"
	echo "${SCRIPT_NAME}: Setup for running on NRG cluster is not complete.  Changes need to be checked/made in this script."
	echo "${SCRIPT_NAME}: EXITING WITHOUT SETTING UP FOR NRG. RETURNING NON-ZERO EXIT STATUS"
	exit 1

    # Set up FSL (if not already done so in the running environment)
    FSLDIR=/nrgpackages/scripts
    . ${FSLDIR}/fsl5_setup.sh
    echo "${SCRIPT_NAME}: Setup to use FSL at ${FSLDIR}"

    # Set up FreeSurfer (if not already done so in the running environment)
    FREESURFER_HOME=/nrgpackages/tools/freesurfer52
    . ${FREESURFER_HOME}/SetUpFreeSurfer.sh
    echo "${SCRIPT_NAME}: Setup to use FreeSurfer at ${FREESURFER_HOME}"

    NRG_SCRIPTS=/nrgpackages/scripts
    . ${NRG_SCRIPTS}/epd-python_setup.sh
    echo "${SCRIPT_NAME}: Setup to use NRG Scripts at ${NRG_SCRIPTS}"
    echo "${SCRIPT_NAME}: Setup Python with ${NRG_SCRIPTS}/epd-python_setup.sh"

    # PIPELINE SPACE...
    export HCPPIPEDIR=/data/hcpdb/pipeline/catalog
    echo "${SCRIPT_NAME}: Setup to use HCP Pipeline Scripts at ${HCPPIPEDIR}"
    echo "${SCRIPT_NAME}: Previous setting of HCPPIPEDIR for HCP Pipeline Scripts does not seem right"

    # StructuralHCP
    export HCPPIPEDIR_PreFS=${HCPPIPEDIR}/StructuralHCP/resources/scripts
    export HCPPIPEDIR_FS=${HCPPIPEDIR}/StructuralHCP/resources/scripts
    export HCPPIPEDIR_PostFS=${HCPPIPEDIR}/StructuralHCP/resources/scripts

    # FunctionalHCP
    export HCPPIPEDIR_fMRISurf=${HCPPIPEDIR}/FunctionalHCP/resources/scripts
    export HCPPIPEDIR_fMRIVol=${HCPPIPEDIR}/FunctionalHCP/resources/scripts
    export HCPPIPEDIR_tfMRIAnalysis=${HCPPIPEDIR}/TaskfMRIHCP/resources/scripts

    # DiffusionHCP
    export HCPPIPEDIR_dMRI=${HCPPIPEDIR}/DiffusionHCP/resources/scripts
    export HCPPIPEDIR_FIX=${HCPPIPEDIR}/FIX_HCP/resources/scripts
	
    # Global and templates
    export HCPPIPETOOLS=/nrgpackages/tools/HCP
    export HCPPIPEDIR_Bin=${HCPPIPETOOLS}/bin
    export HCPPIPEDIR_Config=${HCPPIPETOOLS}/conf
    export HCPPIPEDIR_Global=${HCPPIPETOOLS}/scripts
    export HCPPIPEDIR_Templates=/nrgpackages/atlas/HCP

    export CARET5DIR=${HCPPIPEDIR_Bin}/caret5
    export CARET7DIR=${HCPPIPEDIR_Bin}/caret7/bin_rh_linux64
    echo "${SCRIPT_NAME}: Setup to use Workbench at ${CARET7DIR}"

elif [ "$COMPUTE" = "CHPC" ] ; then
    
    echo "${SCRIPT_NAME}: Setting up for processing on ${COMPUTE}"

    FSLDIR=/export/fsl-5.0.6-20150401
    source ${FSLDIR}/etc/fslconf/fsl.sh
    PATH=${FSLDIR}/bin:${PATH}
    export FSLDIR PATH LD_LIBRARY_PATH
    echo "${SCRIPT_NAME}: Setup to use FSL at ${FSLDIR}"

    # Set up FreeSurfer (if not already done so in the running environment)
    FREESURFER_HOME=/export/freesurfer-5.3-HCP
    . ${FREESURFER_HOME}/SetUpFreeSurfer.sh
    echo "${SCRIPT_NAME}: Setup to use FreeSurfer at ${FREESURFER_HOME}"

    EPD_PYTHON_HOME=/export/epd-7.3.2
    PATH=${EPD_PYTHON_HOME}/bin:${PATH}
    export PATH
    echo "${SCRIPT_NAME}: Setup to use EPD Python at ${EPD_PYTHON_HOME}"

    # PIPELINE SPACE...
    export HCPPIPEDIR=/home/HCPpipeline/pipeline_tools/Pipelines_WU_L1B
    echo "${SCRIPT_NAME}: Setup to use HCP Pipeline Scripts at ${HCPPIPEDIR}"

    # StructuralHCP
    export HCPPIPEDIR_PreFS=$HCPPIPEDIR/PreFreeSurfer/scripts 
    export HCPPIPEDIR_FS=$HCPPIPEDIR/FreeSurfer/scripts
    export HCPPIPEDIR_PostFS=$HCPPIPEDIR/PostFreeSurfer/scripts

    export MSMBin=/NRG/BlueArc/nrgpackages/tools.release/MSMSulc-v1.3-2014.02.10
    echo "${SCRIPT_NAME}: Setup to use MSM binary at ${MSMBin}"

    # FunctionalHCP
    export HCPPIPEDIR_fMRISurf=${HCPPIPEDIR}/fMRISurface/scripts
    export HCPPIPEDIR_fMRIVol=${HCPPIPEDIR}/fMRIVolume/scripts
	
    # Task Analysis
    export HCPPIPEDIR_tfMRIAnalysis=${HCPPIPEDIR}/TaskfMRIAnalysis/scripts

    # DiffusionHCP
    export HCPPIPEDIR_dMRI=${HCPPIPEDIR}/DiffusionPreprocessing/scripts

    # ICA+FIX	
    export HCPPIPEDIR_FIX=${HCPPIPEDIR}/catalog/FIX_HCP/resources/scripts

    # Global and templates
    export HCPPIPETOOLS=${HCPPIPEDIR}/global
    export HCPPIPEDIR_Config=${HCPPIPETOOLS}/config
    export HCPPIPEDIR_Global=${HCPPIPETOOLS}/scripts
    export HCPPIPEDIR_Templates=${HCPPIPETOOLS}/templates

    # Workbench (a.k.a, f.k.a. CARET7)
    # export CARET7DIR=${HCPPIPEDIR_Bin}/caret7/bin_rh_linux64
    export CARET7DIR=/home/HCPpipeline/pipeline_tools/workbench-v1.0/bin_rh_linux64
    echo "${SCRIPT_NAME}: Setup to use Workbench at ${CARET7DIR}"
fi 
