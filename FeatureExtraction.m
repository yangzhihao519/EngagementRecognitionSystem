function [ data_feature_extracted_file ] = FeatureExtraction( X )
% FEATURE EXTRACTION Calculate the main features based on the import file
%   This function will handle the raw data which contains 6 parts of the body
%   Chest; Hip; Neck; Left shoulder; Right shoulder; Right elbow.
%   Each of the part has 2-4 attributes. 
%   And that makes 16 attributes in total.
%   For each attributes, there are 6 variables to be calculated:
%       Maximun value; Minimum value; Average value;
%       Standard deviation; Speed; Energy.
%   So there are in total 16*6 = 96 features after the feature extraction

% Initiate the table
engAll=zeros(108,16);
speAll=zeros(108,16);

% Calculate the features
for i=1:108
	for j=1:16
        % Minimum
		minAll(i,j)=min(X((i-1)*100+1:i*100,j+1)); %108*16
        
        % Maximum
		maxAll(i,j)=max(X((i-1)*100+1:i*100,j+1));
        
        % Average
		avgAll(i,j)=sum(X((i-1)*100+1:i*100,j+1))/100;
        
        %Standard deviation
		Temp=X((i-1)*100+1:i*100,j+1);
		staAll(i,j)=std(Temp,0,1);
        
        % Speed & Energy
		for k=1:5
			speed=max(X((i-1)*100+(k-1)*20+1:(i-1)*100+k*20,j+1))-min(X((i-1)*100+(k-1)*20+1:(i-1)*100+k*20,j+1));   %speed
			speAll(i,j)=speAll(i,j)+speed;
			engAll(i,j)=engAll(i,j)+speed^2;
		end
		speAll(i,j)=speAll(i,j)./5;
		
    end
end

% Generate the column of all the 96 features (16*6)
for j=1:16
	Y(:,(j-1)*6+1)=minAll(:,j);
	Y(:,(j-1)*6+2)=maxAll(:,j);
	Y(:,(j-1)*6+3)=avgAll(:,j);
	Y(:,(j-1)*6+4)=staAll(:,j);
	Y(:,(j-1)*6+5)=speAll(:,j);
	Y(:,(j-1)*6+6)=engAll(:,j);
end

% Generate the abbreviate variable names as title
position={'CAP';'CLT';'CR';'HAP';'HLT';'HR';'LSF';'LSA';'LSI';'NF';'NS';'REF';'RES';'RSF';'RSA';'RSI'};
TP={'Min';'Max';'Avg';'Std';'Spe';'Eng'};

Title={};
for i=1:16
	for j=1:6
		string=sprintf('%s_%s',position{i},TP{j});
		string=strrep(string, ' ', '');
		Title=[Title;string];
    end
end

% Insert the title of variable names into the data
data={};
for j=1:96
	columns={Title{j}};
	data2=table(Y(:,j),'VariableNames', columns);
	data=horzcat(data,data2);
end

% Write the data into a new CSV file
currentTime = datetime('now');
newFileName = strcat(datestr(currentTime), '.csv');
writetable(data, newFileName);
data_feature_extracted_file = newFileName;
% disp(data);

end

