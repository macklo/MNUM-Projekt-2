function [ eigenvalues, iteracje,success] = eigvalS( A, tol, imax )
%eigvalS Oblicznie wartosci wlasnych metoda rozkladu QR z przesunieciami
%   tol - tolerancja
%   imax - maksymalna liczba iteracji
    success = 1;
    n=size(A,1);
    eigenvalues = diag(zeros(n));
    INITIALsubmatrix = A; %macierz pocz�tkowa (oryginalna)
    iteracje = 0;
    for k = n:-1:2 
        DK = INITIALsubmatrix; %macierz startowa dla jednej wart. w�asnej
        i = 0;
        while i<= imax & max(abs(DK(k,1:k-1)))>tol
            DD = DK(k-1:k,k-1:k); %macierz 2x2 prawego dolnego rogu
            [ev1,ev2]=quadpolynroots(1,-(DD(1,1)+DD(2,2)),DD(2,2)*DD(1,1)-DD(2,1)*DD(1,2));
            %najbli�sza DK(k,k) warto�� w�asna podmacierzy DD
            if abs(ev1 - DD(2,2)) < abs(ev2-DD(2,2))
                shift = ev1;
            else
                shift = ev2;
            end
            DK = DK - eye(k)*shift; %macierz przesuni�ta
            [Q1,R1] = qrmgs(DK); %faktoryzajca QR
            DK = R1 *Q1 +eye(k)*shift; %macierz przekszta�cona
            i = i+1;
            iteracje = iteracje + 1;
        end
        if i >imax
            success = 0;
            disp('imax reached')
        end
        eigenvalues(k) = DK(k,k);
        if k>2
            INITIALsubmatrix = DK(1:k-1,1:k-1); %deflacja macierzy
        else
            eigenvalues(1) = DK(1,1); %ostatnia warto�� w�asna
        end
    end
end

