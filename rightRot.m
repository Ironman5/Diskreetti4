function [RR,root] = rightRot(A,X,root)

% X,Y,Z sekä T2 tulevat tehtävänannon Figure 2:sta

RR = A; % kopioitu taulukko A
Y = A(X,1); % X:n vasen lapsi
T2 = A(Y,2); % Y:n oikea lapsi

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
    RR(X,1) = -1; % jos X:n vasenta lasta ei ole
end

% 7. compute the height of the subtree whose root is X
T2_pituus = RR(T2,4);
Z = RR(RR(X,2),4);             %Z = X:n oikean alihaaran pituus
RR(X,4)=max(Z+1,T2_pituus+1); % X:n pituus

% 8. compute the height of the subtree whose root is Y
T1 = RR(Y,4);
T1_pituus = RR(T1,4);
X_pituus=RR(X,4);
RR(Y,4)=max(X_pituus+1, T1_pituus+1); % Y:n pituus

% 9. compute the height of the subtree whose root is A
A_vasenpituus = RR(RR(root,1),4);
Y_pituus=RR(Y,4);
RR(root,4)=max(Y_pituus+1,A_vasenpituus+1); % A:n pituus


end
