% Function to find parameters of the Whittle-Matern family of functcions that 
% ensure the best fit between a set of experimentally measured function (ACF)
% and the analytical function, between the length scales rmin and Rmax
% "SavedACF" - input file with the set of experimental functions to fit
% "Rmin" - size of the smallest resolvable spot (defined by image
% resolution), in pixels
% "savename" - name of file in which output data needs to be saved
%
% written by Lusik Cherkezyan on January 20, 2017 (20170120)
% last updated: 20170120 by: l. cherkezyan
%

function get_D(SavedACF,Rmin,saveName)
% Rmin - resolution of TEM images 
load(SavedACF);% file contents:'ACF','Rmin','SNR','prefix','outlier'
%find directory where Saved ACF is located:
index = strfind(SavedACF,'\');
directory = SavedACF(1:index(end));
%%% fit Whittle-Matern ACF to each experimental ACF:
for xx  = 1:size(ACF,1)
        [~, rmax] = find(ACF(xx,:)< 0.02);
        Rmax(xx)  = min(rmax);
        r         = (Rmin:Rmax(xx));
        [m, Ln(xx), ~] = Fit_loop(ACF(xx,:)./ACF(xx,Rmin),Rmin,Rmax(xx));
        D(xx) = 2*m;
end

[x ind]  = min(abs(mean(ACF,1)./mean(ACF(:,Rmin)) - 0.01));
% plot mean ACF and boxplot D values
figure,
subplot 121, plot (mean(ACF,1)./mean(ACF(:,Rmin)),'linewidth',2)
xlabel(['r, pixels']), ylabel(['ACF']), axis([1 ind -0.05 1.1])
set(gca,'fontsize',12)
subplot 122, boxplot (D), ylabel('D')
set(gca,'fontsize',12)

save([directory,'D_',saveName],'D','Ln','ACF','Rmin','SNR','prefix','outlier');

