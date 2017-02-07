function output = get_D(SavedACF,Rmin,saveName)
% 24500X magnification
% % 1pix=5nm
% Rmin = 1 ;%resolution of TEM images is 1 pixel
% cd(['L:\User\TEM\ROI']);
% load  acf_wt.mat
%%% fit Whittle-Matern ACF to each experimental ACF:
for xx  = 1:size(ACF,1)
        [~, rmax] = find(ACF(xx,:)< 0.02);
        Rmax(xx)  = min(rmax);
        r         = (Rmin:Rmax(xx));
        [m, Ln(xx), ~] = Fit_loop(ACF(xx,:)./ACF(xx,Rmin),Rmin,Rmax(xx));
        D(xx) = 2*m;
end

%%% obtain mean values for all images analyzed:
% mean and SD of ACF:
control     = mean(ACF,1)./mean(ACF(:,Rmin));
sd_control  = std(ACF,[],1)./mean(ACF(:,Rmin));
% mean and SD of D: 
D_mean   = mean(D);
D_SD  = std(D)./mean(D);
% normalize by ACF(Rmin)
for num = 1:size(ACF,1)
   ACF_C(num,:)=ACF(num,:)./ACF(num,Rmin);
end

% plot mean ACF and boxplot D values
figure,
subplot 131, plot (control)
subplot 132, boxplot (D)

save(saveName,'D','Ln','ACF','Rmin','SNR','prefix','outlier');

