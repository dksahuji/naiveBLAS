function [Q, R]= QR(A)
% A - mxn matrix
% Q - mxn matrix (Orthogonal Matrix)
% R - nxn matrix (upper triangular)
% explained in notes Applied Numerical Computing by L. Vandenberghe and
% S.Boyd chapter 9
m = size(A,1);
n = size(A,2);
Q = zeros(m,n);
R = zeros(n,n);

if size(A,2)~=0
R(1,1) = norm(A(:,1));
Q(:,1) = A(:,1)/R(1,1);
R(1,2:end) = Q(:,1)'*A(:,2:end);
[Q(:,2:end), R(2:end,2:end)] = QR(A(:,2:end) - Q(:,1)*R(1,2:end));
end
end