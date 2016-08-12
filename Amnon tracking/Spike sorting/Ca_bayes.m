function [ Ca_estimated, Spikes ] = Ca_bayes(Ca_data)
%UNTITLED2 Summary of this function goes here
%   This funciton applies Baysian spike inference for Ca data
%   and saves the results of denoised Ca signal. Baseline estimation
%   and other parameters are estimated from the data. Data start is under
%   estimated

T=size(Ca_data,1);
N=size(Ca_data,2);

Ca_estimated=zeros(T,N);
Spikes=zeros(T,N);

tic
parfor i=1:N
    
    % with baseline set
    % [c,b,c1,g,sn,sp]=constrained_foopsi( Ca_data(:,i),min(Ca_data(:,i)) );
    
    % baseline estimate from data
    [c,b,c1,g,sn,sp]=constrained_foopsi( Ca_data(:,i) );
    
    Ca_estimated(:,i)=c;
    Spikes(:,i)=sp;
        
end
toc

end

