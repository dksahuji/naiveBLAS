function [P, L, U] = PLU(A)
% A nxn matrix 
% L nxn lower triangular matrix
% U nxn upper triangular matrix
% explained in notes Applied Numerical Computing by L. Vandenberghe and
% S.Boyd chapter 7
% ADDED PIVOTING to function LU(.)
    L = zeros(size(A));
    U = zeros(size(A));
    P = eye(size(A,1));
    %A = P'*A;
    keyboard
    if isequal(size(A,1),1)
        if A == 0
            display('singular :');
        else
            L(1,1) = 1;
            U(1,1) = A;
        end
    else
        if A(1,1) == 0
%             for i=1:size(A,1)
%                 P = swap_row(eye(size(A,1)),1,i);
%                 A_ = P'*A;
%                 if A_(1,1) ~= 0
%                     break;
%                 end
%             end
%             if i>=size(A,1)
%                 display('singular:');
%                 return;
%             end
            index = find(A(:,1)~=0);
            
            if isempty(index)
                display('singular :');
                return;
            else
                P = swap_row(eye(size(A,1)),1,index(end));
                A = P'*A;
            end
        end
        L(1,1) = 1; % l_11 = 1
        U(1,1) = A(1,1); % u_11 = a_11
        A_new = A(2:end,2:end) - (A(2:end,1)*A(1,2:end)/A(1,1));
        [P2, L(2:end,2:end), U(2:end,2:end)]= PLU(A_new); 
        P = P * [1 zeros(1,size(A,1)-1); zeros(size(A,1)-1,1) P2];
        L(2:end,1) = P2'*A(2:end,1)/A(1,1);
        U(1,2:end) = A(1,2:end);
    end
end

function A = swap_row(A,i,j)
    temp = A(i,:);
    A(i,:) = A(j,:);
    A(j,:) = temp;
end