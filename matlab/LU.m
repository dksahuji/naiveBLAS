function [L, U] = LU(A)
% A nxn matrix 
% L nxn lower triangular matrix
% U nxn upper triangular matrix
% explained in notes Applied Numerical Computing by L. Vandenberghe and
% S.Boyd chapter 7
% NO PIVOTING
    L = zeros(size(A));
    U = zeros(size(A));
    if isequal(size(A),[1 1])
        L(1,1) = 1;
        U(1,1) = A;
    else
        L(1,1) = 1; % l_11 = 1
        U(1,1) = A(1,1); % u_11 = a_11
        U(1,2:end) = A(1,2:end); % U_12 = A_12
        L(2:end,1) = A(2:end,1)/A(1,1); % L_21 = A_21/a_11;
        [L(2:end,2:end), U(2:end,2:end)]= LU(A(2:end,2:end) - L(2:end,1)*U(1,2:end));
    end
end