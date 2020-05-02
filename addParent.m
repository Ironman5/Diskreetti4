function A = addParent(A,root)

if A(root,1)== -1 && A(root,2)== -1
    A(root,3) = root;
elseif A(root,1)== -1
    A(root,3) = root;
    A = addParent(A,A(root,2));
elseif A(root,2)== -1
    A(root,3) = root;
    A = addParent(A,A(root,1));
else
    A(root,3) = root;
    A = addParent(A,A(root,1));
    A = addParent(A,A(root,2));
end

    
