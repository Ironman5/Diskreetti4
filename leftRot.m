function [leftRot, root] = leftRot(A,root,X)

% X,Y,Z sekä T3 tulevat tehtävänannon Figure 2:sta

% Kopioidaan taulukko A
leftRot = A;
Z = A(X,2); 
R = A(X,3);
T3 = A(Z,1);

% Siirretään Z X:n paikalle
leftRot(Z,1) = X; % Z:n vasen puu on X
leftRot(Z,3) = A(X,3); % Z:n isä on
leftRot(X,2) = Z; % R:n oikea lapsi on Z

% Jos X:n isä on juuri niin R on uusi juuri
if R == root
    root = Z;
end

% Siirretään X Y:n paikalle
leftRot(X,3) = Z; % X:n isä on Z
leftRot(X,2) = T3; % X:n oikea lapsi on T3

% Siirretään T3 X:n oikeaksi lapseksi
if T3 > -1
    leftRot(T3,3) = X;
end



% % 1. set the left child of Z to X
% a = A(X,2); % 5 oikea alapuu = 9
% b = A(a,1); % 9 vasen alapuu = 8
% RotA(X,2) = b;
% % 2. set the right child of X to the root of T3
% a = A(X,2); % 9
% b = A(a,1);
% RotA(a,1) = X; % 9 oikeaksi alipuuksi 8
% % 3. set the parent of X to Z
% a = A(X,2); % 9
% RotA(X,3) = a;
% % 4. set the parent of the root of T3 to X
% a = A(X,2); % 9
% b = A(a,1); % 9
% RotA(b,3) = X;
% % 5. set the parent of Z to A
% a = A(X,2); % 9
% RotA(a,3) = root;
% % 6. set either the left child or the right child of A to Z
% RotA(root,2) = A(X,2);
% 7. compute the height of the subtree whose root is X

% 8. compute the height of the subtree whose root is Z

% 9. compute the height of the subtree whose root is A

end