function [N] = N_4node(xi, eta)
  % bilinearQuadShapeFunctions: Computes the shape functions for a 4-node
  % bilinear quadrilateral element.
  %
  % Input:
  %   xi  : Local coordinate (-1 <= xi <= 1)
  %   eta : Local coordinate (-1 <= eta <= 1)
  %
  % Output:
  %   N   : 1x4 array containing the shape function values [N1, N2, N3, N4]

  % Shape functions for a bilinear quadrilateral element:
  N1 = 0.25 * (1 - xi) * (1 - eta);
  N2 = 0.25 * (1 + xi) * (1 - eta);
  N3 = 0.25 * (1 + xi) * (1 + eta);
  N4 = 0.25 * (1 - xi) * (1 + eta);

  N = [N1, N2, N3, N4];

end
