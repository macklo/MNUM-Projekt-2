function [ x1, x2 ] = quadpolynroots( a,b,c )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    l1 = -b + sqrt(b*b - 4*a*c);
    l2 = -b - sqrt(b*b - 4*a*c);
    if abs(l1) > abs(l2)
       licznik = l1;
    else
        licznik = l2;
    end
    x1 = licznik/(2*a);
    x2 = ((-b)/a) - x1;
end

