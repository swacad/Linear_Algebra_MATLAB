function [ x_out ] = laff_scal( alpha, x )

% x = laff_scal( alpha, y ) scales a vector x by alpha

% Extract the row and column sizes of x
[ m_x, n_x ] = size( x );


% Check if alpha is scalar.  Return 'FAILED' if not a scalar.
if ~isscalar(alpha)
    x_out = 'FAILED';
    return
end

% Check if x is a vector.  Return 'FAILED' if not a vector.
if ~isvector(x)
    x_out = 'FAILED';
    return
end

if ( n_x == 1 )     % x is a column vector
    for i = 1 : m_x
       x(i, 1) = x(i, 1) * alpha; 
    end
else   % x is row vector
    for i = 1 : n_x
       x(1, i) = x(1, i) * alpha;
    end
end

% Return the updated x in x_out
x_out = x;

return
end