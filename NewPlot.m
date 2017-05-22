clear ; close all; clc

subject=['Chen';'Clement';'Gal';'Howard';'Ilario';'Jingran';'Michael';'Xinyi';'Yuxiao'];

%读取数据，根据数据库
X=[1:1799];
filename=['chest';'hip';'left_shoulder';'neck';'right_elbow';'right_shoulder'];
alltitlename={['Anterior(+)/posterior(-)_tilt';'Lateral_tilt_left(-)/right(+)';'Rotation_left(+)/right(-)'];
['Anterior(+)/posterior(-)_tilt';'Lateral tilt left(-)/right(+)';'Rotation_left(+)/right(-)'];
['Flexion(-)/extension(+)';'Abduction(+)/adduction(-)';'Internal(-)/external(+)_rotation'];
['Flexion(+)/extension(-)';'Sidebend_left(-)/right(+)'];
['Flexion(-)/extension(+)';'Supination(+)/pronation(-)'];
['Flexion(-)/extension(+)';'Abduction(+)/adduction(-)';'Internal(-)/external(+)_rotation']
};



for j=1:6	%j是部位
%for j=1:2	%test
	figure (j);

	
	
	for k=1:3
		

		for i=1:9
			subplot(3, 2, 2*k-1)
			path1=sprintf('%s-engaged/%s.csv',subject(i,:),filename(j,:));
			path1=strrep(path1, ' ', '');
			Y1=csvread(path1);  %1800*4
	
			path2=sprintf('%s-not+engaged/%s.csv',subject(i,:),filename(j,:));
			path2=strrep(path2, ' ', '');
			Y2=csvread(path2);  %1800*4


			hold on;
			plot (X,Y1(2:end,k),'r-');

			hold on;
			plot(X,Y2(2:end,k),'b-');

			subplot(3, 2, 2*k)
			plot(X,Y2(2:end,k)-Y1(2:end,k));
			hold on;

		end
		
		subplot(3, 2, 2*k-1)

		%命名
		A=alltitlename{j,1};
		lengthA=size(A,1);
		disp(lengthA);

		if (k>lengthA)
			titleName2=sprintf('%d-not_existed',k);

		else
			titleName2=sprintf('%d -%s',k,A(k,:));
			disp('1');
		endif

		titleName2=strrep(titleName2, ' ', '');
		title(titleName2);

		
		xlim([0,1800]);
		ylim('auto');
		legend('Location','northeastoutside');
		legend('Engaged','Not Engaged');
		xlabel('Frame');
		set(gca, 'xtick', 0:200:1800);  
		ylabel('Angle')
		grid on;
		pause;
		
	end

	Save_path=sprintf('all-pics/Aggr_%s.png',filename(j,:));
	Save_path=strrep(Save_path, ' ', '');
	print(Save_path,'-dpng');

	                                     

end
