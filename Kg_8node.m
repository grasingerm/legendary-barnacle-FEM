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
## @deftypefn {} {@var{retval} =} Kg_4node (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: grasingerm <grasingerm@grasingerm-np5xnp6xnp7xpnkpnhpnj>
## Created: 2025-04-26

function Kg = Kg_8node(D, t, x, y, conn, n)
  if nargin < 6
    n = 2;
  endif

  % initialize global stiffness matrix
  assert(length(x) == length(y), "Length of x and y must match");
  ndofs = 2 * length(x); % 2 * length(y)
  Kg = zeros(ndofs, ndofs);

  % compute element stiffnesses and assemble
  num_elems = size(conn, 1);
  for i=1:num_elems
    nodes = conn(i, :);
    xelem = x(nodes);
    yelem = y(nodes);
    Kei = Ke_8node(D, xelem, yelem, n);

    % assemble into global stiffness matrix
    enodes = 8;
    for j=1:enodes % loop over all pairs of degrees of freedom
      for k=1:enodes
        for L=1:2
          for M=1:2
            jlocal = 2*j - 2 + L;
            klocal = 2*k - 2 + M;
            jglobal = 2*nodes(j) - 2 + L;
            kglobal = 2*nodes(k) - 2 + M;
            Kg(jglobal, kglobal) = Kg(jglobal, kglobal) + Kei(jlocal, klocal);
          endfor
        endfor
      endfor
    endfor
  endfor

  % correct for thickness
  Kg = t*Kg;

endfunction
