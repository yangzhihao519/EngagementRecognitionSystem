clear ; close all; clc

%????????? ??????????????????????????????????????????
path1='all-pics/Aggr_engaged.csv';
X=dlmread(path1);  
engAll=zeros(108,16);
speAll=zeros(108,16);

for i=1:108
	for j=1:16
		
		minAll(i,j)=min(X((i-1)*100+1:i*100,j+1)); %108*16
		maxAll(i,j)=max(X((i-1)*100+1:i*100,j+1));
		avgAll(i,j)=sum(X((i-1)*100+1:i*100,j+1))/100;
		Temp=X((i-1)*100+1:i*100,j+1);
		staAll(i,j)=std(Temp,0,1);

		for k=1:5
			speed=max(X((i-1)*100+(k-1)*20+1:(i-1)*100+k*20,j+1))-min(X((i-1)*100+(k-1)*20+1:(i-1)*100+k*20,j+1));   %speed
			speAll(i,j)=speAll(i,j)+speed;
			engAll(i,j)=engAll(i,j)+speed^2;
		end
		speAll(i,j)=speAll(i,j)./5;
		
	end


end


for j=1:16
	Y(:,(j-1)*6+1)=minAll(:,j);
	Y(:,(j-1)*6+2)=maxAll(:,j);
	Y(:,(j-1)*6+3)=avgAll(:,j);
	Y(:,(j-1)*6+4)=staAll(:,j);
	Y(:,(j-1)*6+5)=speAll(:,j);
	Y(:,(j-1)*6+6)=engAll(:,j);
end
temp=1:108;

Y=[temp' ones(108,1) Y];

Save_path=sprintf('all-pics/process_engaged.csv');
	csvwrite(Save_path,Y);



path2='all-pics/Aggr_not+engaged.csv';

X=dlmread(path2);  
engAll=zeros(108,16);
speAll=zeros(108,16);

for i=1:108
	for j=1:16
		
		minAll(i,j)=min(X((i-1)*100+1:i*100,j+1)); %108*16
		maxAll(i,j)=max(X((i-1)*100+1:i*100,j+1));
		avgAll(i,j)=sum(X((i-1)*100+1:i*100,j+1))/100;
		Temp=X((i-1)*100+1:i*100,j+1);
		staAll(i,j)=std(Temp,0,1);

		for k=1:5
			speed=max(X((i-1)*100+(k-1)*20+1:(i-1)*100+k*20,j+1))-min(X((i-1)*100+(k-1)*20+1:(i-1)*100+k*20,j+1));   %speed
			speAll(i,j)=speAll(i,j)+speed;
			engAll(i,j)=engAll(i,j)+speed^2;
		end
		speAll(i,j)=speAll(i,j)./5;
		
	end


end


for j=1:16
	Z(:,(j-1)*6+1)=minAll(:,j);
	Z(:,(j-1)*6+2)=maxAll(:,j);
	Z(:,(j-1)*6+3)=avgAll(:,j);
	Z(:,(j-1)*6+4)=staAll(:,j);
	Z(:,(j-1)*6+5)=speAll(:,j);
	Z(:,(j-1)*6+6)=engAll(:,j);
end
temp=1:108;

Z=[temp' zeros(108,1) Z];

Save_path=sprintf('all-pics/process_not+engaged.csv');
	csvwrite(Save_path,Z);

AggrAll=[Y;Z];
%Save_path=sprintf('all-pics/process_All.csv');
%	csvwrite(Save_path,AggrAll);


position={'CAP';'CLT';'CR';'HAP';'HLT';'HR';'LSF';'LSA';'LSI';'NF';'NS';'REF';'RES';'RSF';'RSA';'RSI'};
TP={'Min';'Max';'Avg';'Std';'Spe';'Eng'};

Title={'ID';'Affect'};
for i=1:16
	for j=1:6
		string=sprintf('%s_%s',position{i},TP{j});
		string=strrep(string, ' ', '');
		Title=[Title;string];

	end

end
data={};
for j=1:98
	columns={Title{j}};
	data2=table(AggrAll(:,j),'VariableNames', columns);
	data=horzcat(data,data2);
end
Affect={'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'Eng';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';
'NE';}
data2=table(Affect,'VariableNames', {'Affect2'});
data=horzcat(data,data2);
writetable(data, 'all-pics/process_All2.csv');
disp(data);
% columns = {'LastName', 'Gender', 'Age', 'Location', 'Height', 'Weight', 'Smoker'};

% data = table(Y(:,1), Y(:,2), Y(:,3), Y(:,4), Y(:,5), Y(:,6), Y(:,7), 'VariableNames', columns); 
% columns2={columns{3}};
% data2=table(Y(:,1),'VariableNames', columns2);
% data=horzcat(data,data2);
% disp(data);
% 基于这些单独的变量创建一个table类型变量data


