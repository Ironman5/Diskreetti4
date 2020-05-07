%[A,root] = randBST(10);
%A = addParent(A,root);
%root = 2;
%A
%load("taulukkoA.mat")
% plotTreeA(A)
%C = 
% addHeight(A, root)
%B = addHeight(A, root)
%X = 5;
% [leftRotA,rootA] = leftRot(A,X,root)
% plotTreeA(leftRotA)
% [rightRotA,rootB] = rightRot(A,X,root)
% plotTreeA(rightRotA)


% a4 = addHeight(addParent(a,11))
%plotTreeA(a4)
% b4 = addHeight(addParent(b,10))
%plotTreeA(b4)
% c4 = addHeight(addParent(c,8))
%plotTreeA(c4)
%ra4 =rotations01(a,11)

% Tehtävä 5
n = 50; pisteet = 1000;
BST = zeros(pisteet,4,n);
roots = zeros(1,n);
h1 = zeros(1,n);

for i = 1:n
    [BST(:,1:2,i),roots(i)] = randBST(pisteet);
    BST(:,:,i) = addParent(BST(:,:,i),roots(i));
    BST(:,:,i) = addHeight(BST(:,:,i),roots(i));
    h1(i) = max(BST(:,4,i));
end

