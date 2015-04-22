function [ w,x, y  ] = Zadanie1B( rozm )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    imax = 10000;
    tol = 0.00001;
    A = rand(rozm);
    AS = A + A';
    eigvalSA = sort(eigvalS(A, tol, imax));
    eigvalSAS = eigvalS(AS, tol, imax);
    eigvalAS = eigval(AS, tol, imax);
    
    eigA = sort(eig(A));
    eigAS = eig(AS);
    
    eSA = abs ((eigvalSA) - (eigA));
    eSAS = abs (sort(eigvalSAS) - sort(eigAS));
    eAS = abs (sort(eigvalAS) - sort(eigAS));
    
    meSA = mean(eSA);
    meSAS = mean(eSAS);
    meAS = mean(eAS);
    w = [meAS; meSAS; meSA];
    x = [eigvalSA, eigA];
    y = eSA;
end

