%The analysis code that was used in: Vetter P., Bola L., Reich L., Bennett M., Muckli L., Amedi A. (2020). Decoding natural sounds in early â€œvisualâ€? cortex of congenitally blind individuals. Current Biology.
%The code was originally created by Fraser W. Smith (see Smith & Muckli 2010 PNAS)and was adapted to this project by Petra Vetter and Lukasz Bola.

function [input_file_info]=getFileInfo(subject, Hem, CondClass, POIfile_ind)

%%% important parameters
%nVols=218; write for each individual subject, inside each if loop (number excluding the dummy volumes)
nPreds=108+1;   %% number of stimulation blocks plus 1 for baseline 
%CondClass=1:3;   %% the conditions to classify, their codes in txt file
nTrials=108; %number of stimulation blocks (without baseline) per run
nPerRun=54;   %% number of blocks per condition per run. Each block is how many trials per category, as they are defined in the trial sequence file.

if(strcmp(subject,'sub-1'))
    nVols = [361 359 358]; % insert the number of volumes for each run 
    %- these are made up, change accordingly! And add to each subject
    %individually
    
    % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-1/'; %data for that subject
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
    if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-1_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-1_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-1_LH_V3.poi';
         else
             poi_name ='sub-1_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-1_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-1_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-1_RH_V3.poi';
         else
             poi_name ='sub-1_RH_EVC.poi'; %EVC POI
        end
    end
    
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-1_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-1_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-1_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-1_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-1_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-1_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-1_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-1_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-1_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    
   % dm_name2{1}='EL_AVScenesLong_Run1_SCSAI_3DMCTS_LTR_THPGLMF3c_TAL.sdm'; % you might not need these
   % dm_name2{2}='EL_AVScenesLong_Run2_SCSAI_3DMCTS_LTR_THPGLMF3c_TAL.sdm';
   % dm_name2{3}='EL_AVScenesLong_Run3_SCSAI_3DMCTS_LTR_THPGLMF3c_TAL.sdm';
   % dm_name2{4}='EL_AVScenesLong_Run4_SCSAI_3DMCTS_LTR_THPGLMF3c_TAL.sdm';
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    
elseif(strcmp(subject,'sub-2'))
    nVols = [360 358 360 357]; % insert the number of volumes for each run  
    
        % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-2/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-2_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-2_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-2_LH_V3.poi';
         else
             poi_name ='sub-2_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-2_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-2_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-2_RH_V3.poi';
         else
             poi_name ='sub-2_RH_EVC.poi'; %EVC POI
        end
    end
    
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-2_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-2_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-2_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-2_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-2_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-2_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-2_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-2_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-2_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-2_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-2_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-2_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';
    
elseif(strcmp(subject,'sub-3'))
     nVols = [359 360 359 362]; % insert the number of volumes for each run 
    
               % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-3/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-3_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-3_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-3_LH_V3.poi';
         else
             poi_name ='sub-2_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-3_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-3_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-3_RH_V3.poi';
         else
             poi_name ='sub-3_RH_EVC.poi'; %EVC POI
        end
    end
    
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-3_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-3_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-3_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-3_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-3_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-3_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-3_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-3_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-3_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-3_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-3_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-3_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';

elseif(strcmp(subject,'sub-4'))
     nVols = [361 362 362 360]; % insert the number of volumes for each run 
    
               % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-4/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-4_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-4_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-4_LH_V3.poi';
         else
             poi_name ='sub-4_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-4_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-4_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-4_RH_V3.poi';
         else
             poi_name ='sub-4_RH_EVC.poi'; %EVC POI
        end
    end
    
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-4_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-4_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-4_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-4_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-4_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-4_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-4_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-4_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-4_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-4_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-4_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-4_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';

elseif(strcmp(subject,'sub-5'))
     nVols = [362 371 359 360]; % insert the number of volumes for each run 
       
               % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-5/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-5_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-5_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-5_LH_V3.poi';
         else
             poi_name ='sub-5_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-5_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-5_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-5_RH_V3.poi';
         else
             poi_name ='sub-5_RH_EVC.poi'; %EVC POI
        end
    end
    
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-5_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-5_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-5_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-5_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-5_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-5_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-5_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-5_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-5_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-5_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-5_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-5_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';

elseif(strcmp(subject,'sub-6'))
    nVols = [358 362 358 362]; % insert the number of volumes for each run  

               % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-6/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-6_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-6_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-6_LH_V3.poi';
         else
             poi_name ='sub-6_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-6_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-6_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-6_RH_V3.poi';
         else
             poi_name ='sub-6_RH_EVC.poi'; %EVC POI
        end
    end
    
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-6_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-6_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-6_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-6_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-6_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-6_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-6_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-6_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-6_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-6_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-6_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-6_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';
    
    
elseif(strcmp(subject,'sub-7'))
     nVols = [359 358 358 359]; % insert the number of volumes for each run 
    
	  % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-7/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-7_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-7_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-7_LH_V3.poi';
         else
             poi_name ='sub-7_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-7_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-7_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-7_RH_V3.poi';
         else
             poi_name ='sub-7_RH_EVC.poi'; %EVC POI
        end
    end
    
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-7_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-7_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-7_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-7_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-7_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-7_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-7_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-7_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-7_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-7_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-7_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-7_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';


elseif(strcmp(subject,'sub-8'))
     nVols = [360 375 359 362]; % insert the number of volumes for each run 
    
	  % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-8/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-8_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-8_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-8_LH_V3.poi';
         else
             poi_name ='sub-8_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-8_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-8_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-8_RH_V3.poi';
         else
             poi_name ='sub-8_RH_EVC.poi'; %EVC POI
        end
    end
    
      
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-8_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-8_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-8_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-8_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-8_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-8_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-8_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-8_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-8_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-8_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-8_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-8_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';

elseif(strcmp(subject,'sub-9'))
     nVols = [368 358 360 360]; % insert the number of volumes for each run 
    
	  % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-9/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-9_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-9_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-9_LH_V3.poi';
         else
             poi_name ='sub-9_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-9_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-9_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-9_RH_V3.poi';
         else
             poi_name ='sub-9_RH_EVC.poi'; %EVC POI
        end
    end
    
      
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-9_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-9_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-9_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-9_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-9_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-9_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-9_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-9_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-9_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-9_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-9_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-9_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';

elseif(strcmp(subject,'sub-10'))
    nVols = [358 358 360 357]; % insert the number of volumes for each run 
   
	  % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-10/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-10_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-10_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-10_LH_V3.poi';
         else
             poi_name ='sub-10_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-10_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-10_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-10_RH_V3.poi';
         else
             poi_name ='sub-10_RH_EVC.poi'; %EVC POI
        end
    end
    
      
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-10_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-10_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-10_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-10_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-10_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-10_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-10_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-10_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-10_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-10_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-10_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-10_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';

elseif(strcmp(subject,'sub-14'))
    nVols = [360 360 361 357]; % insert the number of volumes for each run 
   
	  % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-14/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-14_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-14_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-14_LH_V3.poi';
         else
             poi_name ='sub-14_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-14_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-14_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-14_RH_V3.poi';
         else
             poi_name ='sub-14_RH_EVC.poi'; %EVC POI
        end
    end
    
      
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-14_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-14_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-14_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-14_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-14_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-14_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-14_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-14_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-14_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-14_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-14_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-14_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';

elseif(strcmp(subject,'sub-15'))
    nVols = [358 359 362 361]; % insert the number of volumes for each run 
    
	  % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-15/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-15_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-15_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-15_LH_V3.poi';
         else
             poi_name ='sub-15_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-15_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-15_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-15_RH_V3.poi';
         else
             poi_name ='sub-15_RH_EVC.poi'; %EVC POI
        end
    end
    
      
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-15_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-15_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-15_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-15_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-15_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-15_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-15_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-15_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-15_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-15_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-15_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-15_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';

elseif(strcmp(subject,'sub-16'))
     nVols = [361 360 362 367]; % insert the number of volumes for each run 
    
	  % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-16/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-16_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-16_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-16_LH_V3.poi';
         else
             poi_name ='sub-16_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-16_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-16_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-16_RH_V3.poi';
         else
             poi_name ='sub-16_RH_EVC.poi'; %EVC POI
        end
    end
    
      
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-16_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-16_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-16_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-16_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-16_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-16_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-16_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-16_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-16_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-16_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-16_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-16_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';

elseif(strcmp(subject,'sub-17'))
    nVols = [361 361 359 366]; % insert the number of volumes for each run 
   
	  % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-17/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-17_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-17_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-17_LH_V3.poi';
         else
             poi_name ='sub-17_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-17_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-17_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-17_RH_V3.poi';
         else
             poi_name ='sub-17_RH_EVC.poi'; %EVC POI
        end
    end
    
      
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-17_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-17_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-17_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-17_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-17_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-17_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-17_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-17_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-17_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-17_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-17_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-17_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';

elseif(strcmp(subject,'sub-18'))
     nVols = [359 358 360 358]; % insert the number of volumes for each run 
    
	  % the path to the files
    dir_name='/MRIWork/MRIWork10/pv/giusi_pollicina/data_for_MVPA/sub-18/';
    % (note the slashes change direction on a pc) 
    % the poi file - patch of interest
    
  if(Hem=='LH')
        if POIfile_ind == 1
            poi_name='sub-18_LH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-18_LH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-18_LH_V3.poi';
         else
             poi_name ='sub-18_LH_EVC.poi'; %EVC POI
        end
        
    elseif(Hem=='RH')
        if POIfile_ind == 1
            poi_name='sub-18_RH_V1.poi'; %V1
         elseif POIfile_ind == 2 %V2
             poi_name='sub-18_RH_V2.poi'; %add another elseif to add another POI
         elseif POIfile_ind == 3
             poi_name='sub-18_RH_V3.poi';
         else
             poi_name ='sub-18_RH_EVC.poi'; %EVC POI
        end
    end
    
      
    % the mtc file - mesh time course files
    if(Hem=='LH')
        mtc_name{1}='sub-18_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{2}='sub-18_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{3}='sub-18_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        mtc_name{4}='sub-18_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_LH.mtc';
        
    elseif(Hem=='RH')
        mtc_name{1}='sub-18_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{2}='sub-18_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{3}='sub-18_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        mtc_name{4}='sub-18_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL_RH.mtc';
        
    end
    
    % the design matrix files (single trial, single block based)
    dm_name{1}='sub-18_1_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{2}='sub-18_2_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{3}='sub-18_3_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
    dm_name{4}='sub-18_4_SCCTBL_3DMCTS_THPGLMF6c_256_trilin_2x1.0_TAL.sdm';
 
    
    % the condition specifier files
    % crucial file, maps single trials or blocks onto experimental conditions
    cond_locs_name{1}='animate_inanimate.txt';
    cond_locs_name{2}='animate_inanimate.txt';
    cond_locs_name{3}='animate_inanimate.txt';
    cond_locs_name{4}='animate_inanimate.txt';
   

 end


% find condition locations and put them into one variable, cond_locs
cond_locs=[];
if(strcmp(subject,'sub-1'))
    tot_nRuns = 3;
else tot_nRuns = 4;
    
end
    
for i=1:tot_nRuns %n of runs (number of trial seq files)
    tmp=load([dir_name cond_locs_name{i}]);
    cond_locs(:,i)=tmp;
end



% put into structure for easy parsing
input_file_names=[]; %not used anywhere else in the script - what for?
pars(1)=0; %nVols is saved separately as vector in the structure array below
pars(2)=nPreds;  %% remember to add 1 for the constant column
pars(3)=nTrials;
pars(4)=nPerRun;

input_file_info.dir_name=dir_name;
input_file_info.poi_name=poi_name;
input_file_info.mtc_name=mtc_name;
input_file_info.dm_name=dm_name;  %% block or trial wise
%input_file_info.dm2=dm_name2; %% condition wise
input_file_info.cond_locs=cond_locs;
input_file_info.pars=pars;
%input_file_info.CondClass=CondClass; %commented out at the beginning
input_file_info.subject=subject;
input_file_info.Hem=Hem;
input_file_info.nVols_all = nVols; %this is customised for Giusi's experiment!




