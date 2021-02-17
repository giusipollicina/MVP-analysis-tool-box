%The analysis code that was used in: Vetter P., Bola L., Reich L., Bennett M., Muckli L., Amedi A. (2020). Decoding natural sounds in early �visual� cortex of congenitally blind individuals. Current Biology.
%The code was originally created by Fraser W. Smith (see Smith & Muckli 2010 PNAS)and was adapted to this project by Petra Vetter and Lukasz Bola.


function sMask2=findCommonMask()

% goal is to make a nice common mask of all activated voxels
% to do a searchlight analysis within
% BVQX uses a mean BOLD > 100 threshold to select voxels
% then just a big intersection
% of course spatial normalization (TAL) plays a key role here

subs{1}='sub-2';
subs{2}='sub-3';
subs{3}='sub-4';
subs{4}='sub-5';
subs{5}='sub-6';
subs{6}='sub-8';
subs{7}='sub-9';
subs{8}='sub-10';
subs{9}='sub-14';
subs{10}='sub-15';
subs{11}='sub-16';
subs{12}='sub-17';
subs{13}='sub-18';
subs{14}='sub-19';
subs{15}='sub-20';
subs{16}='sub-21';
subs{17}='sub-22';
subs{18}='sub-23';
subs{19}='sub-24';
subs{20}='sub-25';



nSubs=length(subs);
maskG=zeros(87,60,69,nSubs);
addpath(genpath('/MRIWork/MRIWork10/pv/giusi_pollicina/matlab_toolboxes/SearchmightToolbox'))

for s=1:nSubs
    names=getFileInfo_vtc(subs{s});
    maskS=ones(87,60,69);
    
    for j=1:length(names.vtc_name)
        
        vtc=BVQXfile([names.dir_name names.vtc_name{j}]);
        data=vtc.VTCData;
        mask=zeros(87,60,69);
        
        mD=squeeze(mean(data,1));
        locs=find(mD>100);  %% good vox thresh BVQX
        
        mask(locs)=1;  %% good locs for this run
        tab(s,j)=length(find(mask));

        maskS=mask&maskS;  %% accumlate to do grand intersection
        
    end
    
    gt(s)=length(find(maskS));
    maskG(:,:,:,s)=maskS;
    
end


sMask1=sum(maskG,4);
ff=find(sMask1==nSubs);
sMask2=zeros(size(maskS));
sMask2(ff)=1;

length(find(sMask2))

% write out the common mask file
outname=sprintf('20Sub_commonMaskFile.vmp');
multiplier=1;  % scale input
lThresh=0;  % lower threshold
write_vmp_v2(outname,sMask2,multiplier,lThresh);
%movefile(outname,'/home/fsmith23/tmp');

% and save a mat file
outname='20Sub_commonMaskFile.mat';
save(outname,'sMask2');

