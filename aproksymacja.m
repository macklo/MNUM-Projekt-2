function [ a, res ] = aproksymacja( x, y, n, meth )
%aproksymacja Summary of this function goes here
%   meth : 1 - uklad rownan normalnych; 2 - qr
    N = size(x,1);
    G = zeros(n,n);
    q = zeros(n,1);
    for i = 1:n
        for k = 1:n
            for j = 1:N
                G(i,k) = G(i,k) + x(j,1)^((i-1)+(k-1));
            end
        end
    end
    
    for k = 1:n
        for j = 1:N
            q(k,1) = q(k,1)+ y(j,1) * x(j,1)^(k-1);
        end
    end

    if meth == 1
        a = inv(G) * q;
        res =  norm(G*a - q);
    elseif meth == 2
        [Q,R] = qrmgs(G);
        a =  inv(R) * inv(Q) * q;
        res =  norm(Q*R*a - q);
    end
        
end

