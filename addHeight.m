function A = addHeight(A,root)

% Käydään silmukassa taulukko A läpi, kutsutaan funktiota polunPituus ja
% lisätään saatu polun pituus taulukon neljänteen riviin

for i = 1:length(A)
    
    if A(i,1) == -1 && A(i,2) == -1
        A(i,4) = 0;
    else
        A(i,4) = polunPituus(i);
    end
end

    function pituus = polunPituus(i)
        % selvitetään regressiolla puun korkeus
        if A(i,1)== -1 && A(i,2)== -1
            pituus = 0;
        elseif A(i,1)== -1 && A(i,2)~= -1
            pituus = 1 + polunPituus(A(i,2));
        elseif A(i,1)~= -1 && A(i,2)== -1
            pituus = 1 + polunPituus(A(i,1));
        else
            pituus = 1 + max(polunPituus(A(i,1)),polunPituus(A(i,2)));
        end
        
    end
end