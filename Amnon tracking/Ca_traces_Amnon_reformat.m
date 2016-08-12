%% Make Amnon traces look like, neuron vs. time frames
%


l=length(find(Ca_Amnon(:,1)==0));   % one frame length
n_frames=length(Ca_Amnon)/l;        % number of frames


for j=0:1:n_frames
    current_frame=find(Ca_Amnon(:,1)==j);  % vertical indexes of all neuron in the frame
    Ca_traces(j+1,:)=Ca_Amnon(current_frame,3);
end


%