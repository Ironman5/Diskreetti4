function A = addHeight(A, root)

% Käydään silmukassa taulukko A läpi ja lisätää 4 sarake eli polun pituus
for i = 1:length(A)
    if A(i,1) == -1 && A(i,2) == -1
        A(i,4) = 0;
    else
        A(i,4) = polunPituus(A,A(i,3))
    end
end

% TÄSTÄ PITÄISI KEHITTÄÄ TOIMIVA FUNKTIO...
    function pituus = polunPituus(A,i)
        % selvitetään regressiolla puun korkeus
        % palauttaa aina 1 JA lisätään se pituuteen 
        % kun pisteiden välillä on viiva eli 1+1+1+...
        
        vasenAliPuu = polunPituus(A(i),i)
        oikeaAliPuu = polunPituus(A(i),i)
        % verrataan alipuiden pituutta ja lisätään pitempi pituuteen
        pituus = pituus + max(vasenAliPuu,oikeaAliPuu)
    end

end


end

      