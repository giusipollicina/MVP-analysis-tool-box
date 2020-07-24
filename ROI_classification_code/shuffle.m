function s = shuffle(sortedArray)
% this function shuffles a sorted array and produces a randomized array of
% the same size but this ranodmization occurs only along ONE dimension the
% infromation along the other dimension(s) remains intact. This function is
% best suited for pseudorandomization of trial parameters in a block. 
    
    n = length(sortedArray);
    
    for i = 1 : 2*n;        
        m1 = randperm(n);  
        m2 = randperm(n);  
        
        temp = sortedArray(m1(1),:);
        sortedArray(m1(1),:) = sortedArray(m2(1),:);
        sortedArray(m2(1),:) = temp;
    end
    
    s = sortedArray;
    
