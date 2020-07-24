%plot the grand average of classification results averaged across subjects

%%%%% 
%Petra Vetter, August 2010
%%%%%

%cd Y:\6\fMRI\Project0050\MV_analysis\ClassifierCode\SubjectResults;

%cd Y:\6\fMRI\Project0050\MV_analysis\ClassifierCode\SubjectResults_V3;

%cd Y:\6\fMRI\Project0050\MV_analysis\ClassifierCode\SubjectResults_V4;

%cd /MRIWork/MRIWork10/pv/giusi_pollicina/MVP-analysis-tool-box/ROI_classification_code/hum-obj-anim-veh_results;
cd /MRIWork/MRIWork10/pv/giusi_pollicina/MVP-analysis-tool-box/ROI_classification_code/1vs2_results;


%load GroupResults_ClassAccu;
%load GroupResults_ClassAccu_V3;
%load GroupResults_ClassAccu_V4;
load GroupResults_ClassAccu_2cat_n13; 

meanResults_singleBlocks = nanmean(pooledResults_singleBlocks(:,1:4));
meanResults_singleBlocks(1,5:8) = nansem(pooledResults_singleBlocks(:,1:4));

meanResults_average = nanmean(pooledResults_average(:,1:4));
meanResults_average(1,5:8) = nansem(pooledResults_average(:,1:4));

% %rearrange for plotting
% % single blocks
% results_forplot_SB(1,1) = meanResults_singleBlocks(1,1); % V1
% results_forplot_SB(1,2) = meanResults_singleBlocks(1,7); % V2
% results_forplot_SB(1,3) = meanResults_singleBlocks(1,8); % V3
% results_forplot_SB(1,4) = meanResults_singleBlocks(1,9); % V2 + V3
% results_forplot_SB(1,5) = meanResults_singleBlocks(1,6); % all EVC
% results_forplot_SB(1,6) = meanResults_singleBlocks(1,10); % auditory 
% results_forplot_SB(1,7) = meanResults_singleBlocks(1,11); % motor
% % do the same for sem
% results_forplot_SB(2,1) = meanResults_singleBlocks(1,12); % V1
% results_forplot_SB(2,2) = meanResults_singleBlocks(1,18); % V2
% results_forplot_SB(2,3) = meanResults_singleBlocks(1,19); % V3
% results_forplot_SB(2,4) = meanResults_singleBlocks(1,20); % V2 + V3
% results_forplot_SB(2,5) = meanResults_singleBlocks(1,17); % all EVC
% results_forplot_SB(2,6) = meanResults_singleBlocks(1,20); % auditory 
% results_forplot_SB(2,7) = meanResults_singleBlocks(1,22); % motor

results_forplot_SB(1,1:4) = meanResults_singleBlocks(1,1:4);
results_forplot_SB(2,1:4) = meanResults_singleBlocks(1,5:8);

results_forplot_SB(3:4,:) = [0];
%add zeros for plotting

% %by average
% results_forplot_AV(1,1) = meanResults_average(1,1); % V1
% results_forplot_AV(1,2) = meanResults_average(1,7); % V2
% results_forplot_AV(1,3) = meanResults_average(1,8); % V3
% results_forplot_AV(1,4) = meanResults_average(1,9); % V2 + V3
% results_forplot_AV(1,5) = meanResults_average(1,6); % all EVC
% results_forplot_AV(1,6) = meanResults_average(1,10); % auditory 
% results_forplot_AV(1,7) = meanResults_average(1,11); % motor
% % do the same for sem
% results_forplot_AV(2,1) = meanResults_average(1,12); % V1
% results_forplot_AV(2,2) = meanResults_average(1,18); % V2
% results_forplot_AV(2,3) = meanResults_average(1,19); % V3
% results_forplot_AV(2,4) = meanResults_average(1,20); % V2 + V3
% results_forplot_AV(2,5) = meanResults_average(1,17); % all EVC
% results_forplot_AV(2,6) = meanResults_average(1,20); % auditory 
% results_forplot_AV(2,7) = meanResults_average(1,22); % motor

results_forplot_AV(1,1:4) = meanResults_average(1,1:4);
results_forplot_AV(2,1:4) = meanResults_average(1,5:8);

results_forplot_AV(3:4,:) = [0];
%add zeros for plotting

%%%%%%%%%%%%%%%%%%%
%plotting


figure;
%plot accuracy for single blocks
bar(results_forplot_SB([1 3],:),'group');
hold on;
errorbars_barplot(results_forplot_SB([1 3],:),results_forplot_SB([2 4],:));
colormap summer;
hold on;
legend('V1','V2','V3','all EVC');
ylabel('Classification Accuracy');
hold on;
chanceLevel(1,1:6) = [0.50];
plot([0:1:5],chanceLevel,'-k')% line for chance level
hold on;
legend boxoff;
set(gca,'box','off');
set(gca,'xlim',[0.6 1.6]); %cuts out the second group (which is 0 anyway)
set(gca,'XTickLabel',{''}); %no xtick labels
set(gca,'ylim',[0 1.03]);
title('2 categories - By Single Blocks n = 13');
%title('V3 - By Single Blocks n = 10');

hgsave('GrandAverage_2cat_SingleBlocks_n13');

figure;
%plot accuracy with cortical areas as groups
bar(results_forplot_AV([1 3],:),'group');
hold on;
errorbars_barplot(results_forplot_AV([1 3],:),results_forplot_AV([2 4],:));
colormap summer;
hold on;
%legend('V1','all V2','all V3','all V2 + V3', 'all EVC','auditory','motor');
legend('V1','V2','V3','all EVC');
%legend for paper figure
ylabel('Classification Accuracy');
hold on;
chanceLevel(1,1:6) = [0.50];
plot([0:1:5],chanceLevel,'-k')% line for chance level
hold on;
legend boxoff;
set(gca,'box','off');
set(gca,'xlim',[0.6 1.6]); %cuts out the second group (which is 0 anyway)
set(gca,'XTickLabel',{''}); %no xtick labels
set(gca,'ylim',[0 1.03]);
title('2 categories - averaged across Blocks n = 13');
%title('V3 - averaged across Blocks n = 10');

hgsave('GrandAverage_2cat_Average_n13');
%hgsave('GrandAverage_V3_Average_n10_forpaper');

% cd Y:\6\fMRI\Project0050\MV_analysis\ClassifierCode\Plots_forpaper;
% % split in 2 plots
% figure;
% 
% bar(results_forplot_AV([1 3],5:7),'group');
% hold on;
% errorbars_barplot(results_forplot_AV([1 3],5:7),results_forplot_AV([2 4],5:7));
% cmap = [0.4286    0.7143    0.4000 %green
%         0         0    0.5625  %blue
%         0.5000         0         0]; %red
% colormap(cmap);
% hold on;
% %legend('early visual cortex','auditory cortex','motor cortex');
% ylabel('Classification Accuracy');
% hold on;
% chanceLevel(1,1:8) = [0.25];
% plot([0:1:7],chanceLevel,'-k')% line for chance level
% hold on;
% legend boxoff;
% set(gca,'box','off');
% set(gca,'xlim',[0.6 1.6]); %cuts out the second group (which is 0 anyway)
% set(gca,'XTickLabel',{''}); %no xtick labels
% set(gca,'ylim',[0 1.03]);
% %title('V1 - averaged across Blocks n = 10');
% %title('V3 - averaged across Blocks n = 10');
% %title('V4 - averaged across Blocks n = 10');
% title('V5 - averaged across Blocks n = 13');
% 
% %hgsave('GrandAverage_V1_Average_EVC_AC_MC_forpaper');
% %hgsave('GrandAverage_V3_Average_EVC_AC_MC_forpaper');
% %hgsave('GrandAverage_V4_Average_EVC_AC_MC_forpaper');
% hgsave('GrandAverage_V5_Average_EVC_AC_MC_forpaper');
% 
% figure;
% 
% bar(results_forplot_AV([1 3],1:3),'group');
% hold on;
% errorbars_barplot(results_forplot_AV([1 3],1:3),results_forplot_AV([2 4],1:3));
% map = colormap(summer);
% colormap(map(32:64,:));
% hold on;
% %legend('V1','V2','V3','EVC');
% ylabel('Classification Accuracy');
% hold on;
% chanceLevel(1,1:8) = [0.25];
% plot([0:1:7],chanceLevel,'-k')% line for chance level
% hold on;
% legend boxoff;
% set(gca,'box','off');
% set(gca,'xlim',[0.6 1.6]); %cuts out the second group (which is 0 anyway)
% set(gca,'XTickLabel',{''}); %no xtick labels
% set(gca,'ylim',[0 1.03]);
% %title('V1 - averaged across Blocks n = 10');
% %title('V3 - averaged across Blocks n = 10');
% %title('V4 - averaged across Blocks n = 10');
% title('V5 - averaged across Blocks n = 13');
% 
% %hgsave('GrandAverage_V1_Average_V1_V2_V3_forpaper');
% %hgsave('GrandAverage_V3_Average_V1_V2_V3_forpaper');
% %hgsave('GrandAverage_V4_Average_V1_V2_V3_forpaper');
% hgsave('GrandAverage_V5_Average_V1_V2_V3_forpaper');


