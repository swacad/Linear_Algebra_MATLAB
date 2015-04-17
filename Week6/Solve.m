

function [ A_out, b_out ] = Solve( A, b )
% Computes the LU factorization of matrix A, A = LU, overwriting 
% the upper triangular part of A with U and the strictly lower 
% triangular part of A with the strictly lower triangular part of L.
% The result is then returned in variable A_out.
% The factored matrix is used to solve Ax = b.

LU = GaussianElimination(A);

z = Ltrsv_unb_var1(LU, b);

x = Utrsv_unb_var1(LU, z);

A_out = LU;
b_out = x;

end

