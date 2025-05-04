## Copyright (C) 2025 grasingerm
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} Ke_4node (@var{D}, @var{x}, @var{y}, @var{xi}, @var{eta}, @var{n})
##
## @seealso{}
## @end deftypefn

## Author: grasingerm <grasingerm@grasingerm-np5xnp6xnp7xpnkpnhpnj>
## Created: 2025-04-06

function retval = Ke_8node(D, x, y, n)
  assert(length(x) == 8 && length(y) == 8, "element nodal coordinates must have a length of 8");
  assert(size(D) == [3 3], "D matrix must be 3 x 3");
  if nargin < 4
    n = 3;
  endif
  [gps, wts] = n_quad_wap(n);
  retval = quad_2D(@(xi, eta) K_integrand(D, x, y, dN_8node(xi, eta)), gps, wts);
endfunction
