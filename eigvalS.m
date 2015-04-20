function [ eigenvalues, iteracje,success] = eigvalS( A, tol, imax )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    success = 1;
    n=size(A,1);
    eigenvalues = diag(zeros(n));
    INITIALsubmatrix = A;
    iteracje = 0;
    for k = n:-1:2 
        DK = INITIALsubmatrix;
        i = 0;
        while i<= imax & max(abs(DK(k,1:k-1)))>tol
            DD = DK(k-1:k,k-1:k);
            [ev1,ev2]=quadpolynroots(1,-(DD(1,1)+DD(2,2)),DD(2,2)*DD(1,1)-DD(2,1)*DD(1,2));
            %ev1 = ev(1);
            %ev2 = ev(2);
            if abs(ev1 - DD(2,2)) < abs(ev2-DD(2,2)),
                shift = ev1;
            else
                shift = ev2;
            end
            DK = DK - eye(k)*shift;
            [Q1,R1] = qrmgs(DK);
            DK = R1 *Q1 +eye(k)*shift;
            i = i+1;
            iteracje = iteracje + 1;
        end
        if i >imax
            success = 0;
            disp('imax reached')
        end
        eigenvalues(k) = DK(k,k);
        if k>2
            INITIALsubmatrix = DK(1:k-1,1:k-1);
        else
            eigenvalues(1) = DK(1,1);
        end
    end
    
    tmp = eigenvalues;
    x = size(tmp,1);
    
    for p=1:x
        eigenvalues(p) = tmp(x+1-p);
    end
end

