function D = D_plane_stress(E, nu)
  % planeStressDMatrix - Returns the plane stress constitutive matrix (D)
  %                      for isotropic linear elastic materials.
  %
  % Syntax:
  %   D = planeStressDMatrix(E, nu)
  %
  % Inputs:
  %   E  - Young's modulus
  %   nu - Poisson's ratio
  %
  % Outputs:
  %   D  - 3x3 plane stress constitutive matrix
  %
  % Example:
  %   E = 200e9; % Pa
  %   nu = 0.3;
  %   D = planeStressDMatrix(E, nu);

  % Check for valid inputs
  if E <= 0 || nu < 0 || nu >= 0.5
      error('Invalid material properties. E must be positive, and nu must be within [0, 0.5).');
  end

  % Calculate the components of the D matrix
  C = E / (1 - nu^2);

  D = C * [1, nu, 0;
           nu, 1, 0;
           0, 0, (1 - nu) / 2];

end
