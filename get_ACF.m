% Function to find and save the autocorrelation functions of grayscale images  
% "directory" - directory where images to analyze are saved
% "prefix" - user-defined prefix of all files to be analyzed, if many images 
% need to be analyzed with same prefix, follow it by "*" 
% "SNR" - a logical variable that determines whether images with poor SNR need to be excluded
% "Rmin" - size of the smallest resolvable spot (defined by image
% resolution), in pixels
% "savename" - name of file in which output data needs to be saved
% "Display"  - logical variable determining whether each calculated ACF
% needs to be displayed

% written by Lusik Cherkezyan on January 20, 2017 (20170120)
% last updated: 20170213 by: l. cherkezyan
%


function [ACF, Rmin, SNR, prefix, outlier] = get_ACF (directory, prefix, SNR, Rmin,saveName, Display);
warning off all
% change directory to the file with all TEM original images:
% cd([directory])
% list all samples in the directory (TIFF files with their names starting 
% with the string determined by variable "prefix")
sample = dir([directory,'\',prefix,'.tif']);
g=0; aa=0;

% Calculate and store ACFs of all images in the directory:
for x = 1:length(sample)
        disp(['Calculating ACF for ',num2str(x), ' out of ',num2str(length(sample))])

            % read the TIFF file into "image"
        image = imread([directory,'\',sample(x).name]);
        [a, b, ~]=size(image);
        im = mean(image(1:2*floor(a/2),1:2*floor(b/2),:),3);
        
%%% assing zeros to the white background:
        img=zeros(size(im));
            for i=1:size(im,1)
                for j=1:size(im,2)
                    if im(i,j)>0 && im(i,j)<224
                       img(i,j) = im(i,j); 
                    end
                end
            end
        clear im
        %%% create an ROI with the nucleus:
        l   = bwlabel(img);
        lbw = bwareaopen(l,600,4);
        im = img.*lbw;
        clear img rot_img
        
        %%% crop out empty spaces around the nucleus:
        [xx,yy]=find(im);
        s1=max(xx)-min(xx);
        s2=max(yy)-min(yy);
        img=zeros(s1,s2);
        img(1:s1+1,1:s2+1)=im(min(xx):max(xx),min(yy):max(yy));
        
        %%% set the mean value of gray-scaleimage to 0:
        img(find(img))=img(find(img))-sum(sum(img))/(length(find(img)));
        s1=size(img,1);s2=size(img,2);
        clear im
 %% image's ready to analyze: calculate the ACF using Wiener-Khinchine theorem: 
        dim = fftshift(((ifftn((abs(fftn(img)).^2)))))/(length(find(img)));
        %%% normalize to 1 at the origin:
        dim = dim./max(max(dim));       
        %%% perform rotational averaging of the 2D ACF:
        acf = rotavg(dim,floor((min(s1,s2)-1)./2),round((s2+1)/2),round((s1+1)/2));
        
        %%% control for SNR: eg if image resolution is 5 pixels, if by the 5th point   
        %%% acf correlation drops below 50% --> most of the signal is noise
            if acf(Rmin)<.5 && SNR == 1 
                g = g + 1;
                outlier(g) = x;
            else 
                aa = aa+1;
                ACF(aa,1:length(acf)) = acf;
                
                if Display == true;
                    figure,
                    subplot(131),imagesc(img),axis image off,colormap jet,
                    subplot(132),imagesc(dim(round((s1+1)/2)-floor((min(s1,s2)-1)./8):round((s1+1)/2)+floor((min(s1,s2)-1)./8),round((s2+1)/2)-floor((min(s1,s2)-1)./8):round((s2+1)/2)+floor((min(s1,s2)-1)./8)),[-0.1 1]), axis image off, %colorbar
                    subplot(133),plot(acf,'linewidth',2)
                    xlabel(['r, pixels']), ylabel(['ACF']), ylim([-0.05 1.1])
                    set(gca,'fontsize',12)
                    set(gcf,'color','w')
                end

            end
 clear img dim acf range
            
end
if ~exist('outlier','var')
    outlier  = 0;
end
if exist('ACF','var')
%%% save ACFs of all samples with the desired name
save([directory,'\acf_',saveName],'ACF','Rmin','SNR','prefix','outlier','sample');
end