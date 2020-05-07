function [LR,root] = leftRot(A,X,root)

% X,Y,Z sekä T3 tulevat tehtävänannon Figure 2:sta

LR = A; % kopioitu taulukko A
Z = A(X,2); % X:n oikea lapsi
T3 = A(Z,1); % Z:n vasen lapsi
  
% Siirretään Z X:n paikalle
LR(Z,1) = X; % Z:n vasen puu on X
LR(Z,3) = A(X,3); % Z:n isä on root
LR(root,2) = Z; % juuren oikea lapsi on Z

% Siirretään X Y:n paikalle ja T3 X:n oikeaksi lapseksi
LR(X,3) = Z; % X: isä on Z
if LR(Z,1) > -1 % jos Z:lla oli vasen lapsi niin
    LR(X,2) = T3; % X: oikea lapsi on T3
    LR(T3,3) = X; % T3:n isä on X
else 
    LR(X,2) = -1; % jos X:n oikea lasta ei ole
end

% 7. compute the height of the subtree whose root is X
Y = LR(X,1);
T3 = LR(X,2)

LR(X,4) = max(Y+1,T3+1)

% 7. compute the height of the subtree whose root is X
T3_pituus = LR(T3,4)
Y=LR(LR(X,1),4) %Y = X:n vasen alihaaran pituus
LR(X,4)=max(Y+1,T3_pituus+1) % X:n pituus

% 8. compute the height of the subtree whose root is Z
LR(Z,4)=LR(Z,4)+1 % Z:n pituus

% 9. compute the height of the subtree whose root is A
LR(root,4)=LR(root,4) % A:n pituus

% 7. compute the height of the subtree whose root is X

% 8. compute the height of the subtree whose root is Z

% 9. compute the height of the subtree whose root is A

end