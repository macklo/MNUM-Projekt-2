function [ rnqr ] = Zadanie2A( m )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    rnqr = zeros(m,1);
    for i = 1:m
        rnqr(i,1) = Zadanie2(i,1);
    end
    for i = 1:m
        rnqr(i,2)= Zadanie2(i,2);
    end
    close all;
end

