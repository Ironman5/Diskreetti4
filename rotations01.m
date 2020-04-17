function [Anew,rootnew] = rotations01(A,root)
% ROTATIONS01 This function uses left and right rotations to try to
% decrease the total height of the input binary tree (BT).
%
% The input to this function is a matrix A and one scalar, root. A BT (not
% necessarily a binary search tree) is stored in matrix A and root.  It is
% assumed that the BT has vertices 1, 2, ... n.  Each row in matrix A
% corresponds to one vertex, hence the number of rows in A is the number of
% vertices in the BT. Only the first two columns of the input matrix A are
% used:
% A(i,1) = the row in matrix A containing the left child of vertex i
% A(i,2) = the row in matrix A containing the right child of vertex i
%
% The root of the BT is contained in input root.
%
% This function uses rotations to try to reduce the height of the input BT.
% The output contains a new matrix Anew and a new vertex root, rootnew,
% corresponding to the BT after rotations are made.  The first two columns
% of Anew have the same meaning as the first two columns of input A. Output
% Anew contains two additional columns having the following meaning:
% Anew(i,3) = the parent of vertex i
% Anew(i,4) = the height of the binary subtree rooted at vertex i

nvert = size(A,1);

if (root > nvert || root < 1)
    t1  = 'The input root is not valid.  It must be at least 1 and at ';
    disp(t1);
    t1  = 'most the number of rows in matrix A.';
    disp(t1);
    error('Stopping execution´of function rotations01.'); 
end

A0    = A(:, [1 2]);

A0 = addParent(A0, root);

A0 = addHeight(A0, root);

A0 = [A0 zeros(nvert,1)];

[Anew, rootnew] = rotationsBottomUp(A0,root,root);

Anew = Anew(:, 1:4);

end

function [A,iroot] = rotationsBottomUp(A,x,iroot)

if x == -1
    return;
else
    % Check if vertex is leaf.  If it is then mark it balanced.
    if A(x,1) == -1 &&  A(x,2) == -1
        A(x,5) = 1;
        return;
    end
    
    % If left unbalanced, then balance it.
    if A(x,1) ~= -1 && A(A(x,1),5) == 0
        [A,iroot] = BottomUpBal02(A, A(x,1), iroot);
    end
    
    % If right unbalanced, then balance it.
    if A(x,2) ~= -1 && A(A(x,2),5) == 0
        [A,iroot] = BottomUpBal02(A, A(x,2), iroot);
    end
    
    leftC  = A(x,1);
    rightC = A(x,2);
    
    % Find the heights of subtrees on the left side of x.
    if leftC == -1
        htLeft = -1;
    else
        htLeft = A(leftC,4);
        
        if A(leftC,1) == -1
            htLeftLeft = -1;
        else
            htLeftLeft = A(A(leftC,1),4);
        end
        
        if A(leftC,2) == -1
            htLeftRight = -1;
        else
            htLeftRight = A(A(leftC,2),4);
        end
        
    end
    
    % Find the heights of subtrees on the right side of x.
    
    if rightC == -1
        htRight = -1;
    else
        htRight = A(rightC,4);
        
        if A(rightC,1) == -1
            htRightLeft = -1;
        else
            htRightLeft = A(A(rightC,1),4);
        end
        
        if A(rightC,2) == -1
            htRightRight = -1;
        else
            htRightRight = A(A(rightC,2),4);
        end
        
    end
    
    % Confirm the height of the vertex currently being processed.
    
    A(x,4) = 1 + max(htLeft, htRight);
    
    % Compute the height after a right rotation and decide whether it
    % makes sense to do a right rotation.
    
    if leftC == -1
        doRightRot = false;
    else
        
        htRightRot = 1+max( htRight, htLeftRight);
        htRightRot = 1+max(htRightRot, htLeftLeft);
        
        if htRightRot < A(x,4)
            doRightRot = true;
        else
            doRightRot = false;
        end
    end
    
    % Compute the height after a left rotation and decide whether it
    % makes sense to do a left rotation.
    
    if rightC == -1
        doLeftRot = false;
    else
        
        htLeftRot = 1+max( htLeft, htRightLeft);
        htLeftRot = 1+max( htLeftRot, htRightRight);
        
        if htLeftRot < A(x,4)
            doLeftRot = true;
        else
            doLeftRot = false;
        end
    end
    
    
    if doRightRot
        
        [A,nux,iroot] = rightRot(A,x,iroot);
        A(x,5)   = 1;
%        A(nux,5) = 1;
    end
    
    if doLeftRot
        [A,nux,iroot] = leftRot(A,x,iroot);
        A(x,5)   = 1;
%        A(nux,5) = 1;
    end
end
end