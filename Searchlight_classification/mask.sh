#!/bin/sh





### Select the proper version of matlab

source /usr/local/apps/psycapps/config/matlab_bash

# Make sure to change this according to your account and that this folder exists

working_directory=$(pwd)/log


script_folder=$(pwd)



  qsub    -l h_rss=4G \
          -o /MRIWork/MRIWork10/pv/giusi_pollicina/MVP-analysis-tool-box/Searchlight_classification/matlab_mask.out \
          -e /MRIWork/MRIWork10/pv/giusi_pollicina/MVP-analysis-tool-box/Searchlight_classification/matlab_mask.err \
           /usr/local/matlab/bin/matlab -nodisplay -nosplash -nodesktop -r "run('/MRIWork/MRIWork10/pv/giusi_pollicina/MVP-analysis-tool-box/Searchlight_classification/findCommonMask.m');exit;"       

