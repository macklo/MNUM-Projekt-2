function [ w, iteracje, success ] = eigval( A ,tol, imax )
%eigval Oblicznie wartosci wlasnych metoda rozkladu QR bez przesuniec
%   tol - tolerancja
%   imax - maksymalna liczba iteracji
%   w - wektor warto�ci w�asnych
%   iteracje - liczba iteracji potrzebnych do znalezienia warto�ci w�asnych
%   success - czy uda�o si� uzyska� wynik zanim liczba iteracji
%   przekroczy�a imax
    success = 1;
    z = zeros(size(A,1));
    for i= 1:imax
        b = A - diag(diag(A));
        if (b == z) | max(max(abs(b))) < tol
            break;
        end
        [q, r] = qrmgs(A);
        A = r * q; %macierz przekszta�cona
    end
    if i == imax
        success = 0;
        disp('Uwaga: osi�gni�to imax');
    end
    w =diag(A);
    iteracje = i;
end

