% Function to find parameters of the Whittle-Matern family of functcions that 
% ensure the best fit between a single experimentally measured function (ACF)
% and the analytical function, between the length scales rmin and Rmax
%
% written by Lusik Cherkezyan on January 20, 2017 (20170120)
% last updated: 20170120 by: l. cherkezyan
%
function [m_out, lc_out, error] = Fit_loop(ACF,rmin,Rmax)
x = rmin:Rmax;
for i=1:105;
    mm(i)=(i+49)./50;
    for j=1:11;
        lc(j)=Rmax.*2/3+(j-1)*Rmax/30;% Ln is confined between 2/3Rmax and Rmax
        bn = (x/lc(j)).^(mm(i)-3/2).*besselk(mm(i)-3/2,x/lc(j));
        bn = bn./max(bn);
        difference = ACF(rmin:Rmax)-bn;
          
        sse(i,j) =sum(difference.^2)./length(x);
    end
end% disp('die')
sser=reshape(sse,length(mm)*length(lc),1);
[error,index]=min(sser);
lc_out=lc(1+floor(index/length(mm)));
m_out=mm(index-length(mm)*floor((index-1)/length(mm)));
