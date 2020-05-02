[A,root] = randBST(5);
A = addParent(A,root);
A(root,3) = 0;
A;
% En saa A(root,3) nollaksi muuten kuin täältä mainin kautta
% Jos keksit miten sen saa tehtyä tuossa addParent-funtiossa niin hieno
% homma 