clear ; close all; clc

%????????? ??????????????????????????????????????????
path1='all-pics/Aggr_engaged.csv';
XEng=dlmread(path1);  

path2='all-pics/Aggr_not+engaged.csv';
XNE=dlmread(path2);  

time=[10,20,30,40,50,60,100,120,150,200]; %10 tests


%colomn title
position={'CAP';'CLT';'CR';'HAP';'HLT';'HR';'LSF';'LSA';'LSI';'NF';'NS';'REF';'RES';'RSF';'RSA';'RSI'};
TP={'Min';'Max';'Avg';'Std';'Spe';'Eng'};

Title={'ID'};
for i=1:16
	for j=1:6
		string=sprintf('%s_%s',position{i},TP{j});
		string=strrep(string, ' ', '');
		Title=[Title;string];

	end

end




for n=1:10
% for n=1:2;

	
	a=1200*9/time(n);  %total clips
	b=time(n);
	
	engAll=zeros(a,16);
	speAll=zeros(a,16);
	minAll=[];maxAll=[];avgAll=[];staAll=[];
	for i=1:a
		for j=1:16
			
			minAll(i,j)=min(XEng((i-1)*b+1:i*b,j+1)); %108*16
			maxAll(i,j)=max(XEng((i-1)*b+1:i*b,j+1));
			avgAll(i,j)=sum(XEng((i-1)*b+1:i*b,j+1))/b;
			Temp=XEng((i-1)*b+1:i*b,j+1);
			staAll(i,j)=std(Temp,0,1);


			
			for k=1:5
				speed=max(XEng((i-1)*b+(k-1)*b/5+1:(i-1)*b+k*b/5,j+1))-min(XEng((i-1)*b+(k-1)*b/5+1:(i-1)*b+k*b/5,j+1));   %speed
				speAll(i,j)=speAll(i,j)+speed;
				engAll(i,j)=engAll(i,j)+speed^2;
			end
			
			speAll(i,j)=speAll(i,j)./b;
			engAll(i,j)=engAll(i,j)./b;
		end


	end
	Y=[];
	for j=1:16
		Y(:,(j-1)*6+1)=minAll(:,j);
		Y(:,(j-1)*6+2)=maxAll(:,j);
		Y(:,(j-1)*6+3)=avgAll(:,j);
		Y(:,(j-1)*6+4)=staAll(:,j);
		Y(:,(j-1)*6+5)=speAll(:,j);
		Y(:,(j-1)*6+6)=engAll(:,j);
	end
	temp=1:a;

	Y=[temp' Y];

	

	engAll=zeros(a,16);
	speAll=zeros(a,16);
	minAll=[];maxAll=[];avgAll=[];staAll=[];
	
	for i=1:a
		for j=1:16
			
			minAll(i,j)=min(XNE((i-1)*b+1:i*b,j+1)); %108*16
			maxAll(i,j)=max(XNE((i-1)*b+1:i*b,j+1));
			avgAll(i,j)=sum(XNE((i-1)*b+1:i*b,j+1))/b;
			Temp=XNE((i-1)*b+1:i*b,j+1);
			staAll(i,j)=std(Temp,0,1);

			
			for k=1:5
				speed=max(XNE((i-1)*b+(k-1)*b/5+1:(i-1)*b+k*b/5,j+1))-min(XNE((i-1)*b+(k-1)*b/5+1:(i-1)*b+k*b/5,j+1));   %speed
				speAll(i,j)=speAll(i,j)+speed;
				engAll(i,j)=engAll(i,j)+speed^2;
			end
			speAll(i,j)=speAll(i,j)./b;
			engAll(i,j)=engAll(i,j)./b;
			
		end


	end
	Z=[];
	for j=1:16
		Z(:,(j-1)*6+1)=minAll(:,j);
		Z(:,(j-1)*6+2)=maxAll(:,j);
		Z(:,(j-1)*6+3)=avgAll(:,j);
		Z(:,(j-1)*6+4)=staAll(:,j);
		Z(:,(j-1)*6+5)=speAll(:,j);
		Z(:,(j-1)*6+6)=engAll(:,j);
	end
	temp=1:a;

	Z=[temp' Z]; %97 col

	AggrAll=[];
	AggrAll=[Y;Z];
	
	data={};
	for j=1:97
		columns={Title{j}};
		data2=table(AggrAll(:,j),'VariableNames', columns);
		data=horzcat(data,data2);
	end


	Eng='Eng'; 
	NE='NE';
	
	Affect={};
	for i=1:a
		Affect=[Affect;Eng];
	end
	for i=1:a;
		Affect=[Affect;NE];
	end
	data2=table(Affect,'VariableNames', {'Affect'});
	data=horzcat(data,data2);
	path3=sprintf('all-pics/process_time_%d.csv',b);
	writetable(data, path3);
	




 end