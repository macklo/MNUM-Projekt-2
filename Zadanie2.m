function [ r ] = Zadanie2( n , meth)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    if meth == 1
        rodz = 'n';
        tytul  = ['Uk�ad r�wna� normalnych - stopie� wielomainu = ' int2str(n-1)];
    else
        rodz = 'qr';
        tytul  = ['Rozk�ad QR - stopie� wielomainu = ' int2str(n-1)];
    end
    gx = -5:0.1:5;
    gx = gx';
    [x,y] = dane();
    [a,r] = aproksymacja(x,y,n,meth);
    z = pval(a,gx);
    scatter(x,y);
    hold on;
    plot(gx,z);
    title(tytul);
    hold off;
    
    savefig(['fig\Zadanie2_' rodz '_' int2str(n) '.fig']);
    f= openfig(['fig\Zadanie2_' rodz '_' int2str(n) '.fig']);
    print(f, ['jpg\Zadanie2_' rodz '_' int2str(n)], '-dpng');
    
end

