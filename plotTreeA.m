function plotTreeA(A)
% plotTreeA plots a binary tree (BT) and labels its vertices 
%
% The input to this function is a matrix A.  This matrix must have at least
% 3 columns, whose contents correspond to a BT as follows:
% A(i,1) = the row in matrix A containing the left child of vertex i
% A(i,2) = the row in matrix A containing the right child of vertex i
% A(i,3) = the parent of vertex i
% If vertex i has no left child, then A(i,1) = -1.
% If vertex i has no right child, then A(i,2) = -1.
% If vertex i is the root, then A(i,3) = 0.
%

[nvert, ~] = size(A);
parent0    = A(:,3);

figure();
treeplot(parent0');
[xvert,yvert] = treelayout(parent0');

for k1 = 1:nvert
   if parent0(k1) ~= 0
      
       if A(parent0(k1),1) == k1
         t1 = [int2str(k1), 'L'];
       else
           t1 = [int2str(k1), 'R'];
       end    
       
   else
       t1 =  int2str(k1);
   end
   
   text(xvert(k1)+0.02, yvert(k1), t1);
    
end

%axis('off');
