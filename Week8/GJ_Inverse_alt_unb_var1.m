
% This algorithm takes two n x n matrices, A and B and performs
% Gauss-Jordan elimination on the matrics which results in an
% inverse of matrix A as B.  The inverted matrix B is returned


function [ B_out ] = GJ_Inverse_alt_unb_var1( A, B )

% Initialize B to identity matrix
  B = eye( size( A ) );

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  [ BTL, BTR, ...
    BBL, BBR ] = FLA_Part_2x2( B, ...
                               0, 0, 'FLA_TL' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    [ B00,  b01,    B02,  ...
      b10t, beta11, b12t, ...
      B20,  b21,    B22 ] = FLA_Repart_2x2_to_3x3( BTL, BTR, ...
                                                   BBL, BBR, ...
                                                   1, 1, 'FLA_BR' );

    %------------------------------------------------------------%
    % Update a01 and a21 temporarily with negative Gauss transform
    % vectors.
    a01 = a01 / alpha11;
    a21 = a21 / alpha11;
    
    % Perform Gauss transforms on A02 and A22 by rank 1 update
    A02 = A02 - a01 * a12t;
    A22 = A22 - a21 * a12t;
    
    % Perform Gauss transforms on B00 and B20 by rank 1 update
    B00 = B00 - a01 * b10t;
    B20 = B20 - a21 * b10t;
    
    % Set b01 and b21 to Gauss transform numbers by taking negative
    % of a01 and a21.
    b01 = -a01;
    b21 = -a21;
    
    % Set a01 and a21 to be zero vectors
    a01 = 0 * a01;
    a21 = 0 * a21;
    
    % Scale current row by multiplicative inverse of alpha11
    a12t = a12t / alpha11;
    b10t = b10t / alpha11;
    beta11 = 1 / alpha11;
    
    % Set alpha11 to 1, so that A becomes the identity matrix
    alpha11 = 1;

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

    [ BTL, BTR, ...
      BBL, BBR ] = FLA_Cont_with_3x3_to_2x2( B00,  b01,    B02,  ...
                                             b10t, beta11, b12t, ...
                                             B20,  b21,    B22, ...
                                             'FLA_TL' );

  end

  B_out = [ BTL, BTR
            BBL, BBR ];

return
