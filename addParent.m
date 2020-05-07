function [A,root]= addParent(A,root)

if A(root,1)~= -1 && A(root,2)~= -1 % jos juurella on lapsia
    newRoot1 = A(root,1); % uusi juuri on on juuren 1. sarake
    A(newRoot1,3) = root; % juuri on uuden juuren isä
    A = addParent(A,newRoot1); % haetaan uuden juuren lapset
    newRoot2 = A(root,2);  % uusi juuri on on juuren 2. sarake
    A(newRoot2,3) = root; % juuri on uuden juuren isä
    A = addParent(A,newRoot2); % haetaan uuden juuren lapset
elseif A(root,1)~= -1 && A(root,2)== -1 % jos juurella on vasen lapsi
    newRoot = A(root,1);
    A(newRoot,3) = root;
    A = addParent(A,newRoot);
elseif A(root,1)== -1 && A(root,2)~= -1 % jos juurella on oikea lapsi
    newRoot = A(root,2);
    A(newRoot,3) = root;
    A = addParent(A,newRoot);
end
