
%% Number of spikes

imagesc(Spikes_round');
set(gca,'Fontsize',30);
colormap('parula');
colorbar;

title('Number of spikes per bin');

%%
neuron=300;
T=(1:201)*100/1000;     % to remember units

figure

%for i=1:19:620
%neuron=i;
    
subplot(3,1,1)
plot(T,Ca_sorted(:,neuron))
box off
set(gca,'Fontsize',20);
title(sprintf('Neuron %d',neuron));
ylabel('Raw fluor a. u.');
xlim([0 max(T)]);

subplot(3,1,2)
plot(T,Ca_denoise(:,neuron))
box off
set(gca,'Fontsize',20);
ylabel('Calcium');
xlim([0 max(T)]);

subplot(3,1,3)
plot(T,Spikes_round(:,neuron),'Marker','.','Markersize',10);
box off
set(gca,'Fontsize',20);
ylabel('Spikes');
xlabel('Time (s)');
xlim([0 max(T)]);

%pause()
%end
%%