function L = cholesky(A)
% A nxn matrix (Positive Semi Definite)
% L nxn matrix (Lower Triangular Matrix)
% explained in notes Applied Numerical Computing by L. Vandenberghe and
% S.Boyd chapter 6
    L = zeros(size(A));
    if isequal(size(A),[1 1])
        L(1,1) = sqrt(A);
    else
        L(1,1) = sqrt(A(1,1));
        L(2:end,1) = A(2:end,1)/L(1,1);
        L(2:end,2:end)= cholesky(A(2:end,2:end) - L(2:end,1)*L(2:end,1)');
    end
    
end