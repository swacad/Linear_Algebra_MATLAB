function [ alpha ] = laff_norm2( x )
%laff_norm2 takes a vector as an input argument and returns the length 
% also known as the "two-norm" of the vector
%   The input vector must be either a row or column vector meaning that
%   it must be a vector of size (n, 1) or (1, n).

% Declare local variables
alpha = 0;

% Check if x is a vector.  Return 'FAILED' if not a vector.
if ~isvector(x)
    alpha = 'FAILED';
    return
end

% Extract the row and column sizes of x
[ m_x, n_x ] = size( x );

% Determine if x is a row or column vector
if ( n_x == 1 )     % x is a column vector
    for i = 1 : m_x
       alpha = alpha + x(i, 1) * x(i, 1); 
    end
else   % x is row vector
    for i = 1 : n_x
       alpha = alpha + x(1, i) * x(1, i);
    end
end

% Take square root of alpha as last step before return
alpha = alpha^(1/2);

end

