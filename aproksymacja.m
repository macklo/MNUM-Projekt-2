function [ a ] = aproksymacja( x, y, n )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    N = size(x,1);
    G = zeros(n,n);
    q = zeros(n,1);
    for i = 1:n
        for k = 1:n
            for j = 1:N
                G(i,k) = G(i,k) + x(j,1)^(i+k);
                q(k,1) = q(k,1)+ y(j,1) * x(j,1)^k;
            end
        end
    end
    q
    G
    a = inv(G) * q;
end

