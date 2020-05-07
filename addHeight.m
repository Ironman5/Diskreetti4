function [A,root] = addHeight(A,root)

% Käydään silmukassa taulukko A läpi, kutsutaan funktiota polunPituus ja
% lisätään saatu polun pituus taulukon neljänteen sarakkeeseen

for i = 1:length(A)
    
    if A(i,1) == -1 && A(i,2) == -1 % jos pisteellä ei ole lapsia niin polun pituus on 0
        A(i,4) = 0;
    else % selvitetään polun i pituus       
        A(i,4) = polunPituus(i);  
    end
end

    function pituus = polunPituus(i)        
        if A(i,1)== -1 && A(i,2)== -1 % jos pisteellä ei ole lapsia niin polun pituus on 0
            pituus = 0;            
        elseif A(i,1)== -1 && A(i,2)~= -1 % jos vasen lapsi puuttuu niin mennään vain oikeaan alipuuhun
            pituus = 1 + polunPituus(A(i,2));
        elseif A(i,1)~= -1 && A(i,2)== -1 % jos oikea lapsi puuttuu niin mennään vain vasempaan alipuuhun
            pituus = 1 + polunPituus(A(i,1));            
        else % mennään molempiin alipuihin
            pituus = 1 + max(polunPituus(A(i,1)),polunPituus(A(i,2)));
        end
        
    end
end