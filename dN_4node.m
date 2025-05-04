function [dN] = dN_4node(xi, eta)
  % bilinearQuadShapeFunctionDerivatives: Computes the derivatives of the shape
  % functions for a 4-node bilinear quadrilateral element with respect to xi and eta.
  %
  % Input:
  %   xi  : Local coordinate (-1 <= xi <= 1)
  %   eta : Local coordinate (-1 <= eta <= 1)
  %
  % Output:
  %   dN_dxi  : 1x4 array containing the derivatives of the shape functions with respect to xi.
  %   dN_deta : 1x4 array containing the derivatives of the shape functions with respect to eta.

  % Derivatives of the shape functions with respect to xi:
  dN1_dxi = -0.25 * (1 - eta);
  dN2_dxi = 0.25 * (1 - eta);
  dN3_dxi = 0.25 * (1 + eta);
  dN4_dxi = -0.25 * (1 + eta);

  dN_dxi = [dN1_dxi, dN2_dxi, dN3_dxi, dN4_dxi];

  % Derivatives of the shape functions with respect to eta:
  dN1_deta = -0.25 * (1 - xi);
  dN2_deta = -0.25 * (1 + xi);
  dN3_deta = 0.25 * (1 + xi);
  dN4_deta = 0.25 * (1 - xi);

  dN_deta = [dN1_deta, dN2_deta, dN3_deta, dN4_deta];

  dN = [dN_dxi; dN_deta];

end
