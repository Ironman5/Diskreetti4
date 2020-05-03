function A = addHeight(A, root)

% Silmukassa käydään koko taulukko A läpi
for i = 1:length(A)
    if A(i,1)~= -1 && A(i,2)~= -1
        % selvitetään regressiolla puun korkeus 
        A = polunPituus(A(i),root) %vasen alipuu, funktion kutsu hiukan sinnepäin...
        A = polunPituus(A(i),root) %oikea alipuu
    elseif A(i,1)~= -1 && A(i,2)== -1
        A = polunPituus(A(i),root) % vasen alipuu
    elseif A(i,1)== -1 && A(i,2)~= -1
        A = polunPituus(A(i),root) % oikea alipuu
    end
end


    function A = polunPituus(A,i)
        % A = palauttaa aina 1 kun pisteiden välillä on viiva
        % eli 1+1+1+...
    end


end