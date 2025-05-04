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
## @deftypefn {} {@var{retval} =} fe_4node (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: grasingerm <grasingerm@grasingerm-np5xnp6xnp7xpnkpnhpnj>
## Created: 2025-04-26

function retval = fe_4node(f0, t, xelem, yelem)
  f3 = 0;
  f4 = 0;
  %gps = [-0.57735026918962584; 0.57735026918962584];
  %wts = [1; 1];
  [gps, wts] = n_quad_wap(2);

  % integrating traction over the top edge
  for i=1:length(gps)
    xi = gps(i);
    wt = wts(i);
    eta = 1.0;
    N = N_4node(xi, eta);
    %x = dot(N, xelem);
    x = N * xelem;
    J = Jacobian(xelem, yelem, dN_4node(xi, eta));
    dL = sqrt(J(1,1)^2 + J(1, 2)^2);
    f3 = f3 - wt*N(3)*(f0*x)*dL;
    f4 = f4 - wt*N(4)*(f0*x)*dL;
  endfor

  % return full element force vector
  retval = zeros(8, 1);
  retval(6) = t*f3;
  retval(8) = t*f4;
endfunction
