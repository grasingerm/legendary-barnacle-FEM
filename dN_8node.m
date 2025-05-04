function [dN] = dN_8node(xi, eta)
  % eightNodeQuadShapeFunctionDerivatives: Computes the derivatives of the shape
  % functions for an 8-node quadratic quadrilateral element with respect to xi and eta.
  %
  % Input:
  %   xi  : Local coordinate (-1 <= xi <= 1)
  %   eta : Local coordinate (-1 <= eta <= 1)
  %
  % Output:
  %   dN_dxi  : 1x8 array containing the derivatives of the shape functions with respect to xi.
  %   dN_deta : 1x8 array containing the derivatives of the shape functions with respect to eta.

  % Derivatives of the shape functions with respect to xi:
  dN1_dxi = 0.25 * (1 - eta) * (2 * xi + eta);
  dN3_dxi = 0.25 * (1 - eta) * (2 * xi - eta);
  dN5_dxi = 0.25 * (1 + eta) * (2 * xi + eta);
  dN7_dxi = 0.25 * (1 + eta) * (2 * xi - eta);
  dN2_dxi = -xi * (1 - eta);
  dN4_dxi = 0.5 * (1 - eta^2);
  dN6_dxi = -xi * (1 + eta);
  dN8_dxi = -0.5 * (1 - eta^2);

  dN_dxi = [dN1_dxi, dN2_dxi, dN3_dxi, dN4_dxi, dN5_dxi, dN6_dxi, dN7_dxi, dN8_dxi];

  % Derivatives of the shape functions with respect to eta:
  dN1_deta = 0.25 * (1 - xi) * (xi + 2 * eta);
  dN3_deta = 0.25 * (1 + xi) * (-xi + 2 * eta);
  dN5_deta = 0.25 * (1 + xi) * (xi + 2 * eta);
  dN7_deta = 0.25 * (1 - xi) * (-xi + 2 * eta);
  dN2_deta = -0.5 * (1 - xi^2);
  dN4_deta = -eta * (1 + xi);
  dN6_deta = 0.5 * (1 - xi^2);
  dN8_deta = -eta * (1 - xi);

  dN_deta = [dN1_deta, dN2_deta, dN3_deta, dN4_deta, dN5_deta, dN6_deta, dN7_deta, dN8_deta];

  dN = [dN_dxi; dN_deta];
end
