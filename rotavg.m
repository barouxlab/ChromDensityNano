% Function to find a rotational average around a center point from a 2D arr
% rotational averaging about center (c1,c2) with sub array of length (len)
%
% written by Jeremy D. Rogers on June 30, 2009 (20090630)
% last updated: 20090630 by: jdrogers
%


function ravg = rotavg(a2, len, c1, c2)
a2sub = a2((c2-len):(c2+len),(c1-len):(c1+len));

dist = ((-len:len)'*(ones(1,2*len+1))).^2;dist = (dist+dist').^.5;
dist = round(dist)+1; % round to nearest pixel and add 1 (start index)

ravg = 1:len+1;
for i=1:len+1
    ravg(i)=mean(a2sub(dist==i));
end
