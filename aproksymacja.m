function [ a, res ] = aproksymacja( x, y, n, meth )
%aproksymacja Summary of this function goes here
%   meth : 1 - uklad rownan normalnych; 2 - qr
    N = size(x,1);
    A = zeros(N,n);
    
    for i=1:N
        for j = 1:n
            A(i,j) = x(i,1)^(j-1);
        end
    end

    if meth == 1
        ata = A'*A;
        aty = A'*y;
        a = ata\aty;
        res = norm(aty - ata*a);
    elseif meth == 2
        [Q,R] = qrmgs(A);
        a =R\Q'*y;
        res = norm(R*a - Q'*y);
    end
        
end

