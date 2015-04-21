function [ a, res ] = aproksymacja( x, y, n, meth )
%aproksymacja Summary of this function goes here
%   meth : 1 - uklad rownan normalnych; 2 - qr
    N = size(x,1);
    G = zeros(n,n);
    A = zeros(n,n);
    q = zeros(n,1);
    for i = 1:n
        for k = 1:n
            for j = 1:N
                G(i,k) = G(i,k) + x(j,1)^((i-1)+(k-1));
            end
        end
    end
    
    for i=1:N
        for j = 1:n
            A(i,j) = x(i,1)^(j-1);
        end
    end
    
    for k = 1:n
        for j = 1:N
            q(k,1) = q(k,1)+ y(j,1) * x(j,1)^(k-1);
        end
    end

    if meth == 1
        a = G\ q;
        z = pval(a, x);
        %res =  norm(z - y);
        res = norm(G*a - q);
    elseif meth == 2
        [Q,R] = qrmgs(A);
        a =R\Q'*y;
        z = pval(a, x);
        %res =  norm(z - y);
        res = norm(Q*R*a - y);
    end
        
end

