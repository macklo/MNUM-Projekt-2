function [ w, iteracje, success ] = eigval( A ,tol, imax )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    success = 1;
    z = zeros(size(A,1));
    for i= 1:imax
        b = A - diag(diag(A));
        if (b == z) | max(max(abs(b))) < tol
            break;
        end
        [q, r] = qrmgs(A);
        A = (q') * A * (q);
    end
    if i == imax
        success = 0;
        disp('Uwaga: osi¹gniêto imax');
    end
    
    w =diag(A);
    
    iteracje = i;
end

