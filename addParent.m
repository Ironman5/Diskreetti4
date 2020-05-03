function A = addParent(A,root)

if A(root,1)~= -1 && A(root,2)~= -1
    newRoot1 = A(root,1);
    A(newRoot1,3) = root;
    A = addParent(A,newRoot1);
    newRoot2 = A(root,2);
    A(newRoot2,3) = root;
    A = addParent(A,newRoot2);
elseif A(root,1)~= -1 && A(root,2)== -1
    newRoot = A(root,1);
    A(newRoot,3) = root;
    A = addParent(A,newRoot);
elseif A(root,1)== -1 && A(root,2)~= -1
    newRoot = A(root,2);
    A(newRoot,3) = root;
    A = addParent(A,newRoot);
end
