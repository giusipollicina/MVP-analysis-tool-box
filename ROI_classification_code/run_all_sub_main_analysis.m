%The analysis code that was used in: Vetter P., Bola L., Reich L., Bennett M., Muckli L., Amedi A. (2020). Decoding natural sounds in early “visual” cortex of congenitally blind individuals. Current Biology.
%The code was originally created by Fraser W. Smith (see Smith & Muckli 2010 PNAS)and was adapted to this project by Petra Vetter and Lukasz Bola.

%this runs the single SVM for all subjects

subjects = {...
    'sub-1','sub-2','sub-3','sub-4','sub-5','sub-6','sub-7','sub-8', 'sub-9', 'sub-10', 'sub-14', 'sub-15', 'sub-16', 'sub-17', 'sub-18'...
    };
CondClass = [1 2 3 4 5 6 7 8 9 10 11 12];

patch = 1;


for subject = 10:12 %length(subjects)
    for POIfile_ind = 4:4   
            run_single_sub_CollapseHem_main_analysis_parallel(subjects{subject},patch,CondClass,POIfile_ind);
    end
end


