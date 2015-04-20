function [Q, R] = qrbp( A )
%qrbp Rozklad QR bez przesuniêæ
%   Detailed explanation goes here
    lw = size (A,1);
    lk = size (A,2);
    Q = zeros (lw,lk);
    R = eye (lk);
    Q(:,1) = A(:,1)
    
    for i = 1:lk
        for j = 1:i-1
            R(j,i) = (Q(:,j)' * A(:,i)) /  (Q(:,j)' * Q(:,j))
        end
        suma = 0;
        for j = 1:i-1
            suma = suma + R(j,i) * Q(:,j)
        end
        
        Q(:,i) = A(:,i) - suma
    end
    Q
    R
end

