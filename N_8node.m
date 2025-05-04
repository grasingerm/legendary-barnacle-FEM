function [N] = N_8node(xi, eta)
  % eightNodeQuadShapeFunctions: Computes the shape functions for an 8-node
  % quadratic quadrilateral element.
  %
  % Input:
  %   xi  : Local coordinate (-1 <= xi <= 1)
  %   eta : Local coordinate (-1 <= eta <= 1)
  %
  % Output:
  %   N   : 1x8 array containing the shape function values [N1, N2, ..., N8]

  % Shape functions for an 8-node quadratic quadrilateral element:
  N1 = 0.25 * (1 - xi) * (1 - eta) * (-xi - eta - 1);
  N2 = 0.5 * (1 - xi^2) * (1 - eta);
  N3 = 0.25 * (1 + xi) * (1 - eta) * (xi - eta - 1);
  N4 = 0.5 * (1 + xi) * (1 - eta^2);
  N5 = 0.25 * (1 + xi) * (1 + eta) * (xi + eta - 1);
  N6 = 0.5 * (1 - xi^2) * (1 + eta);
  N7 = 0.25 * (1 - xi) * (1 + eta) * (-xi + eta - 1);
  N8 = 0.5 * (1 - xi) * (1 - eta^2);

  N = [N1, N2, N3, N4, N5, N6, N7, N8];

end
