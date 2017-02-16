% compare_D(Dfile1, Dfile2) 
% 
% Function performs initial stiatistical comparison between 2 sets of D 
% values via a 2-sided t-test assuming unequal variances using the output 
% files of get_D.m. The finction displays the first 100 points of average 
% autocorrelation functions of each of the two groups overlayed on the same 
% figure along with the two boxplots for all D values n each group. The 
% function does not have any outputs besides the displayed figures.
%
% written by Lusik Cherkezyan on February 13, 2017 (20170213)
% last updated: 20170213 by: l. cherkezyan

function compare_D(Dfile1, Dfile2)
index1 = strfind(Dfile1,'\');
index2 = strfind(Dfile2,'\');
if isempty(index1)
    index1 = strfind(Dfile1,'/');
    index2 = strfind(Dfile2,'/');
end

load(Dfile1)
D1 = D;     clear D;
% define ACF1 as the original ACF normalized to 1 at Rmin
for xx  = 1:size(ACF,1)
    ACF1(xx,:) = ACF(xx,:)./ACF(xx,Rmin); 
end
clear ACF;

load(Dfile2)
D2 = D; clear D;
% define ACF2 as the original ACF normalized to 1 at Rmin
for xx  = 1:size(ACF,1)
    ACF2(xx,:) = ACF(xx,:)./ACF(xx,Rmin); 
end
clear ACF;

% Combine all d values into one vector for plotting, assign category names
Group = [ones(1,length(D1)) 2.*ones(1,length(D2))];
D     = [D1 D2];

% Perform 2-sided t-test assuming unequal variances
[~,p] = ttest2(D1, D2,'tail','both','vartype','unequal');


[~, ind1]  = min(abs(mean(ACF1,1) - 0.01));
[~, ind2]  = min(abs(mean(ACF2,1) - 0.01));

%% Display data
g = figure;
subplot(121), plot(1:100, mean(ACF1(:,1:100),1),'b',1:100, mean(ACF2(:,1:100),1),'r', 'linewidth',2)
legend(Dfile1(index1(end)+ 3:end-4),Dfile2(index2(end)+ 3:end-4))
ylabel('ACF', 'fontname','times', 'fontsize',12)
xlabel('r, pixels', 'fontname','times', 'fontsize',12)
axis([1 max(ind1,ind2) -0.05 1.1])
 
 subplot(122), boxplot(D, Group)
ylabel('D', 'fontname','times', 'fontsize',12,'fontangle','italic')
xlabel('Group', 'fontname','times', 'fontsize',12)
title(['p = ',num2str(p,'%.1e')])
set(gca,'Xticklabel',{Dfile1(index1(end)+ 3:end-4);Dfile2(index2(end)+ 3:end-4)})
set(g, 'position',[500 300 700 350], 'color','w')
