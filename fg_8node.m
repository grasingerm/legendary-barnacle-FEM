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
## @deftypefn {} {@var{retval} =} fg_4node (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: grasingerm <grasingerm@grasingerm-np5xnp6xnp7xpnkpnhpnj>
## Created: 2025-04-27

function fg = fg_8node(f0, t, x, y, conn, f_elems)

  % initialize global force vector
  assert(length(x) == length(y), "Length of x and y must match");
  ndofs = 2 * length(x); % 2 * length(y)
  fg = zeros(ndofs, 1);

  % compute element forces and assemble
  for i=1:length(f_elems)
    elem_idx = f_elems(i);
    nodes = conn(elem_idx, :);
    xelem = x(nodes);
    yelem = y(nodes);
    fei = fe_8node(f0, t, xelem, yelem);

    % assemble into global stiffness matrix
    enodes = 8;
    for j=1:enodes % loop over all pairs of degrees of freedom
      for L=1:2
        jlocal = 2*j - 2 + L;
        jglobal = 2*nodes(j) - 2 + L;
        fg(jglobal) = fg(jglobal) + fei(jlocal);
      endfor
    endfor
  endfor

endfunction
