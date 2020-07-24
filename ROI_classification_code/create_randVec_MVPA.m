function f = create_randVec_MVPA(nTrialsperRun,nPermutations)
%create random vector/array for the MVPA permutation analysis 
%the random array consists of 1000 coloumns (for the 1000 permutations) and
%3 times as many rows as there are trials in one run
%e.g. for Giusi's experiment, there were 108 trials, so we need 324 rows
%and random numbers from 1-324.
% The rows are indicating the trials for the classifier training data set, 
% so each trial of the 3 runs for training should be used only once. 
% That is, the number 1-324 should occur only once in every column, 
% and thus we cannot use randi (with which we would
% have repeated numbers sometimes). This is why we use the shuffle function
% instead - it just puts the numbers in a randomised order.

% inputs are nTrialsRun = number of trials in 1 run, and nPermutations =
% number of permutations, usually 1000.

%%%%% 
%Petra Vetter, July 2020
%%%%%

%create trial Vector with numbers from 1 to the maximum number of number of
%trials times 3 (in steps of 1, integers).
trialVector = [1:1:(nTrialsperRun *3)]'; %needs to be transposed to be 324 rows and 1 column

%shuffle (randomise the order) of trialVector 1000 times and put it as
%columns in array f - the output array.
for p = 1: nPermutations
    s = shuffle(trialVector);
    f(1:length(trialVector),p) = s;
end
 save('randVec_MVPA_Giusi','f');