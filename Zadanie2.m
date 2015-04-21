function [  ] = Zadanie2( n , meth)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    k = 'Zadanie2_';
    l = [n meth];
    gx = -5:0.1:5;
    gx = gx';
    [x,y] = dane();
    [a,r] = aproksymacja(x,y,n,meth);
    z = pval(a,gx);
    scatter(x,y);
    hold;
    plot(gx,z);
    savefig('Zadanie2.fig')
    r
end

