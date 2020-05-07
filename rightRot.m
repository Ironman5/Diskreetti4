function [RR, root] = rightRot(A,X,root)

% X,Y,Z sekä T2 tulevat tehtävänannon Figure 2:sta

% Kopioidaan taulukko A uudeksi taulukoksi RR
RR = A;
Y = A(X,1);  
T2 = A(Y,2); 

% Siirretään Y X:n paikalle
RR(Y,2) = X; % Y:n oikea lapsi on X
RR(Y,3) = A(X,3); % Y:n isä on root
RR(root,2) = Y; % juuren vasen lapsi on Y

% Siirretään X Z:n paikalle ja T2 X:n vasemmaksi lapseksi
RR(X,3) = Y; % X: isä on Y
if A(Y,2) > -1 % jos Y:lla oli oikea lapsi niin
    RR(X,1) = T2; % X:n vasen lapsi on T2
    RR(T2,3) = X; % T2:n isä on X
else 
    RR(X,1) = -1; % muuten X:n vasenta lasta ei ole
end



% 7. compute the height of the subtree whose root is X

% 8. compute the height of the subtree whose root is Z

% 9. compute the height of the subtree whose root is A

end