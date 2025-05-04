function D = D_plane_strain(E, nu)
% D_plane_strain - Returns the plane strain constitutive matrix (D)
%                      for isotropic linear elastic materials.
%
% Syntax:
%   D = planeStrainDMatrix(E, nu)
%
% Inputs:
%   E  - Young's modulus
%   nu - Poisson's ratio
%
% Outputs:
%   D  - 3x3 plane strain constitutive matrix
%
% Example:
%   E = 200e9; % Pa
%   nu = 0.3;
%   D = planeStrainDMatrix(E, nu);

% Check for valid inputs
if E <= 0 || nu < 0 || nu >= 0.5
    error('Invalid material properties. E must be positive, and nu must be within [0, 0.5).');
end

% Calculate the components of the D matrix
C = E / ((1 + nu) * (1 - 2 * nu));

D = C * [1 - nu, nu, 0;
         nu, 1 - nu, 0;
         0, 0, (1 - 2 * nu) / 2];

end
