function [rightRot, root] = rightRot(A,root,X)

% X,Y,Z sekä T2 tulevat tehtävänannon Figure 2:sta

% Kopioidaan taulukko A
rightRot = A;
Y = A(X,1); 
R = A(X,3); 
T2 = A(Y,2); 

% Siirretään Y X:n paikalle
rightRot(Y,2) = X; % Y:n oikea puu on X
rightRot(Y,3) = A(X,3); % Y:n isä on A
rightRot(X,1) = Y; % R:n vasen lapsi on Y

% Jos X:n isä on juuri niin R on uusi juuri
if R == root
    root = R;
end

% Siirretään X Z:n paikalle
rightRot(X,3) = Y; % X:n isä on Y
rightRot(X,1) = T2; % X:n oikea lapsi on T3

% Siirretään T2 X:n vasemmaksi lapseksi
if T2 > -1
    rightRot(T2,3) = X;
end

% 7. compute the height of the subtree whose root is X

% 8. compute the height of the subtree whose root is Z

% 9. compute the height of the subtree whose root is A

end