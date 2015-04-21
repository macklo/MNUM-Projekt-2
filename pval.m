function [ w ] = pval(a , x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    ilprobek = size(x,1);
    stwiel = size(a,1);
    w = zeros(ilprobek,1);
    for i = 1: ilprobek
        for j = 1:stwiel
            w(i) = w(i) + a(j) * x(i)^(j-1);
        end
    end

end

