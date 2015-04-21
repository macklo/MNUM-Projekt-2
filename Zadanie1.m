function [] = Zadanie1(rozm, ilosc)
    imax = 10000;
    tol = 0.00001;
    %ilosc = 30;
    
    IterSym = 0;
    IterSymS = 0;
    IterNSymS = 0;
    
    EigSym = 0;
    EigSymS = 0;
    EigNSymS = 0;
    
    FailSym = 0;
    FailSymS = 0;
    FailNSymS = 0;
    
        for j = 1:ilosc
            A = rand(rozm);
            [E,i,s] = eigvalS(A,tol,imax);

            if(s == 1)
                IterNSymS = IterNSymS + i;
                EigNSymS = EigNSymS + norm(abs(sort(E) - sort(eig(A))),1);
            else
                FailNSymS = FailNSymS +1;
            end
            
            A = A'+ A;
            [E,i,s] = eigval(A,tol,imax);
            
            if(s == 1)
                IterSym = IterSym + i;
                EigSym = EigSym + norm(sort(E) - sort(eig(A)),1);
            else
                FailSym = FailSym +1;
            end
            
            [E,i,s] = eigvalS(A,tol,imax);
            if(s == 1)
                IterSymS = IterSymS + i;
                EigSymS = EigSymS + norm(sort(E) - sort(eig(A)),1);
            else
                FailSymS = FailSymS +1;
            end
        end
        IterSym = IterSym/ilosc
        %EigSym = EigSym/(ilosc*rozm)
        FailSym
        
        IterSymS = IterSymS/ilosc
        %EigSymS = EigSymS/(ilosc*rozm)
        FailSymS
        
        IterNSymS = IterNSymS/ilosc
        %EigNSymS = EigNSymS/(ilosc*rozm)
        FailNSymS
        
        

        
end