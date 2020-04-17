function [A, root] = randBST(n)
% randBST randomly generates a binary search tree (BST)
%
% The input to this function, n, must be a positive integer.  This function
% generates randomly a BST.  The vertices of the BST are 1, 2, ... n.  The
% BST is stored in a matrix A and a scalar root.  The scalar root is the
% vertex that is the root of BST.  The matrix A has n rows and two columns,
% whose contents contain the following information:
% A(i,1) = the row in matrix A containing the left child of vertex i
% A(i,2) = the row in matrix A containing the right child of vertex i
% A(i,3) = the parent of vertex i
% If vertex i has no left child, then A(i,1) = -1.
% If vertex i has no right child, then A(i,2) = -1.
%

if n < 1
    error('The number of vertices must be at least 1.');
end

n = floor(n);

xvec = randperm(n);

root = -1;
A     = [];
for x = xvec
    
    [A, root] = ins1vertA(A,x,root);
end


end

function [A, iroot] = ins1vertA(A,x,iroot)
%
% The input to this function is a n*2 matrix A and two scalars iroot and x.
% A binary search tree (BST) is stored in matrix A as follows:
% A(i,1) = the row in matrix A containing the left child of vertex i
% A(i,2) = the row in matrix A containing the right child of vertex i
% If vertex i has no left child, then A(i,1) = -1.
% If vertex i has no right child, then A(i,2) = -1.
% The root of the BT is vertex iroot.
%
% In this function a new vertex having key x is inserted into the BST.
%

if isempty(A)
    A(x,1) = -1;
    A(x,2) = -1;
    iroot  = x;
    
else
    
    nux    = iroot;
    parent = 0;
    
    leftC  = false;
    
    while nux ~= -1
        
        parent = nux;
        
        if x > nux
            leftC = false;
            nux   = A(nux,2);
        else
            leftC = true;
            nux   = A(nux,1);
        end
        
    end
    
    if leftC
        A(parent,1) = x;
    else
        A(parent,2) = x;
    end
    A(x,1)      = -1;
    A(x,2)      = -1;
    
    
end

end