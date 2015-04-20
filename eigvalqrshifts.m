function [eigenvalues, iters, valid] = eigvalqrshifts(A,tol,imax)
% A - macierz
% tol - tolerancja (górna granica warto?ci) elementów zerowanych
% imax - maksymalna liczba iteracji
% eigenvalues - wektor wartosci wlasnych
% iters - liczba wszystkich wykonanych iteracji algorytmu
% t_elapsed - czas dzialania funkcji
% valid - wykonanie funkcji bez przekroczenia imax
t_start = tic;
valid = 1;
n = size(A, 1); %rozmiar macierzy
eigenvalues = diag(zeros(n)); %alokacja pamieci na wartosci wlasne
iters = 0;
INITIALsubmatrix = A;
for k=n:-1:2
 DK = INITIALsubmatrix(1:k, 1:k); %macierz poczatkowa dla wyznaczenia 
 %jednej wartosci wl.
 i = 0;
 while i <= imax && max(abs(DK(k,1:k-1))) > tol
 ev = roots([1, -(DK(k-1,k-1)+DK(k,k)), DK(k-1,k-1)*DK(k,k)-DK(k,k-1)*DK(k-1,k)]);
 % MAT = [a b]
 % [c d]
 % 1*x^2 -(a+d)*x +a*d-c*b <- tak wyglada rownanie dla macierzy 2x2
 %gdy trzeba wyznaczyc wartosc wlasna, ktora jest pierwiastkami
 %zerowymi tego rownania

 if abs(ev(1)-DK(k,k)) <= abs(ev(2)-DK(k,k))
 shift = ev(1); %przesuniecie - najblizsza DK(k,k) wartosc wlasna
 %analizowanej macierzy 2x2
 else
 shift = ev(2);
 end
 DK = DK - eye(k)*shift; %macierz przesunieta
 [Q1, R1] = qrmgs(DK); %faktoryzacja QR
 DK = R1*Q1 + eye(k)*shift;%macierz przeksztalcona
 i = i+1;
 iters = iters + i;
 end

 if i > imax
 %display('qrshifts imax exceeded program terminated');
 valid = 0;
 break;
 end

 eigenvalues(k) = DK(k,k);
 if k>2
 INITIALsubmatrix=DK(1:k-1,1:k-1); %deflacja macierzy
 else
 eigenvalues(1) = DK(1,1); %ostatnia wartosc wlasna
 end
end

t_elapsed = toc(t_start);
end
