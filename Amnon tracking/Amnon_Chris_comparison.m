

%% Characteristic traces

load('Ca_traces_Chris_Amnon.mat');

%figure;
figure('units','normalized','outerposition',[0 0 0.8 0.8]); % show figure window
  
for neuron_id=1:5:620

subplot(2,1,1)
plot(Ca_traces_Amnon(:,neuron_id))
box off
ylabel('Fluorescence (Amnon)')
xlim([0 size(Ca_traces_Amnon,1)])
title(sprintf('Neuron %d',neuron_id))
set(gca,'Fontsize',15)

subplot(2,1,2)
plot(Ca_traces_Chris(:,neuron_id))
xlim([0 size(Ca_traces_Chris,1)])
ylabel('Fluorescence (Chris)')
xlabel('Frames');
box off
set(gca,'Fontsize',15)

pause();

end
%%


%% Make a simple evalutaion of two recordings based on cross-correlation

N=size(Ca_traces_Amnon,2);
Ca_corr_raw=zeros(N,N);

figure('units','normalized','outerposition',[0 0 0.8 0.8]); % show figure window
% Step by step computation of the normalized cross-correlation matrix
for i=1:N
           
        a=Ca_traces_Amnon(:,i);
        b=Ca_traces_Chris(:,i);
        c = xcorr(a,b);        
        Ca_xcorr_Amnon_Chris(i) = max(c)/max([xcorr(a,a);xcorr(b,b)]); % normalize cross-corr at zero lag by maximal correlation possible
        
end

bar(Ca_xcorr_Amnon_Chris);

set(gca,'Fontsize',30)
title('Normalized X-corr at 0 lag between Chris and Amnon Ca-traces')
xlabel('Neuron ID')
ylabel('Cross-correlation')
xlim([0 N]);
ylim([0 1]);
box off;

%% Computes linear correlation between the traces


%% Make a simple evalutaion of two recordings based on cross-correlation

N=size(Ca_traces_Amnon,2);
Ca_corr_raw=zeros(N,N);

figure('units','normalized','outerposition',[0 0 0.8 0.8]); % show figure window
% Step by step computation of the normalized cross-correlation matrix
for i=1:N
           
        a=Ca_traces_Amnon(:,i);
        b=Ca_traces_Chris(:,i);
        c = corr(a,b);        
        Ca_corr_Amnon_Chris(i) = c; % normalize cross-corr at zero lag by maximal correlation possible
        
end

bar(Ca_corr_Amnon_Chris);

set(gca,'Fontsize',30)
title('Pearson correlation between Chris and Amnon Ca-traces')
xlabel('Neuron ID')
ylabel('Cross-correlation')
xlim([0 N]);
ylim([-1 1]);
box off;

%%

%% Histogram of correlation coefficients

figure('units','normalized','outerposition',[0 0 0.8 0.8]); % show figure window

histogram(Ca_corr_Amnon_Chris,20);
set(gca,'Fontsize',30)

title('Distribution of correlation coefficients in the population')
xlabel('Correlation')
ylabel('Count')

box off;

%%