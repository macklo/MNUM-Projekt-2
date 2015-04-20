function [] = Zadanie1(rozm)
    imax = 10000;
    tol = 0.00001;
    ilosc = 30;
    
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
            %sort(E)
            %sort(eig(A))
            %sort(E) - sort(eig(A))
            %norm(sort(E) - sort(eig(A)));
            if(s == 1)
            IterNSymS = IterNSymS + i;
            Etmp = sort(E) - sort(eig(A));
            tmp = 0;
            for i = 1:rozm
                tmp = tmp + abs(Etmp(i,1) * Etmp(i,1));
            end
            %EigNSymS = EigNSymS + sqrt(tmp);
            EigNSymS = EigNSymS + norm(sort(E) - sort(eig(A)));
            else
                FailNSymS = FailNSymS +1;
            end
            
            A = A'+ A;
            [E,i,s] = eigval(A,tol,imax);
            
            if(s == 1)
            IterSym = IterSym + i;
            EigSym = EigSym + norm(sort(E) - sort(eig(A)));
            else
                FailSym = FailSym +1;
            end
            
            [E,i,s] = eigvalS(A,tol,imax);
            if(s == 1)
            IterSymS = IterSymS + i;
            EigSymS = EigSymS + norm(sort(E) - sort(eig(A)));
            else
                FailSymS = FailSymS +1;
            end
        end
        IterNSymS = IterNSymS/ilosc
        EigNSymS = EigNSymS/ilosc
        
        IterSym = IterSym/ilosc
        EigSym = EigSym/ilosc
        
        IterSymS = IterSymS/ilosc
        EigSymS = EigSymS/ilosc
        
        FailSym
        FailSymS
        FailNSymS
        
end