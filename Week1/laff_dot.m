function [ alpha ] = laff_dot( x, y )

% y = dot( x, y ) multiplies each element in x by the corresponding
% element in y and adds them to a running total which is store in
% alpha.  alpha is returned by the function which is a scalar

% Initialize alpha to zero
alpha = 0;

% Extract the row and column sizes of x and y
[ m_x, n_x ] = size( x );
[ m_y, n_y ] = size( y );

% Make sure x and y are (row or column) vectors of equal length
if ( m_x ~= 1 && n_x ~= 1 ) || ( m_y ~= 1 && n_y ~= 1 )
    alpha = 'FAILED';
    return
end
if ( m_x * n_x ~= m_y * n_y )
    alpha = 'FAILED';
    return
end

if ( n_x == 1 )     % x is a column vector
    if ( n_y == 1 )     % y is a column vector
        % Multiply each element in x by the corresponding y element
        % and add the product to alpha looping through for all 
        % elements in x and y.
        for i=1:m_x   
            alpha = alpha + y( i,1 ) * x( i,1 );
        end
    else     % y is a row vector
        % Multiply each element in x by the corresponding y element
        % and add the product to alpha looping through for all 
        % elements in x and y.
        for i=1:m_x   
            alpha = alpha + y( 1,i ) * x( i,1 );
        end
    end
else    % x is a row vector
    if ( n_y == 1 )     % y is a column vector
        % Multiply each element in x by the corresponding y element
        % and add the product to alpha looping through for all 
        % elements in x and y.
        for i=1:n_x   
            alpha = alpha + y( i,1 ) * x( 1,i );
        end
    else     % y is a row vector
        % Multiply each element in x by the corresponding y element
        % and add the product to alpha looping through for all 
        % elements in x and y.
        for i=1:n_x   
            alpha = alpha + y( 1,i ) * x( 1,i );
        end
    end
end

return
end