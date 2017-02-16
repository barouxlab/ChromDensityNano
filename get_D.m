% Function to find parameters of the Whittle-Matern family of functcions that 
% ensure the best fit between a set of experimentally measured function (ACF)
% and the analytical function, between the length scales rmin and Rmax
% "SavedACF" - input file with the set of experimental functions to fit
% "Rmin" - size of the smallest resolvable spot (defined by image
% resolution), in pixels
% "savename" - name of file in which output data needs to be saved
%
% written by Lusik Cherkezyan on January 20, 2017 (20170120)
% last updated: 20170213 by: l. cherkezyan
%

function get_D(SavedACF,Rmin,saveName)
% Rmin - resolution of TEM images 
load(SavedACF);% file contents:'ACF','Rmin','SNR','prefix','outlier'
%find directory where Saved ACF is located:
index = strfind(SavedACF,'\');
directory = SavedACF(1:index(end));
%%% fit Whittle-Matern ACF to each experimental ACF:
for xx  = 1:size(ACF,1)
         disp(['Calculating D for ',num2str(xx), ' out of ',num2str(size(ACF,1))])
         % find separation distance at which Acf decays to 0.02
         [~, rmax] = find(ACF(xx,:)< 0.02);
         % set Rmax to the determined above separation distance
         Rmax(xx)  = min(rmax);
         % ACF to be fitted from the resolution distance in pixels to Rmax 
         r         = (Rmin:Rmax(xx));
         % ACF normalized to 1 at resolution (Rmin)
         ACFnorm(xx,:) = ACF(xx,:)./ACF(xx,Rmin); 
         % find best-fit function from the Whittle-Matern family 
         [m, Ln(xx), ~] = Fit_loop(ACFnorm(xx,:),Rmin,Rmax(xx));
         % By definition, D = 2m;
         D(xx) = 2*m;
end

[~, ind]  = min(abs(mean(ACFnorm,1) - 0.01));

% plot mean ACF and boxplot D values
figure,
subplot 121, plot (mean(ACFnorm,1),'linewidth',2)
xlabel('r, pixels'), ylabel('ACF'), axis([1 ind -0.05 1.1])
set(gca,'fontsize',12)
subplot 122, boxplot (D), ylabel('D')
set(gca,'fontsize',12)

save([directory,'D_',saveName],'D','Ln','ACF','Rmin','SNR','prefix','outlier');

