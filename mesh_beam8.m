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
## @deftypefn {} {@var{[x, y, conn, f_elems, bc_nodes]} =} mesh_beam (@var{h}, @var{l}, @var{n})
## x is a vector of x-coordinates of the reference positions of the nodes
## y is a vector of y-coordinates of the reference positions of the nodes
## @seealso{}
## @end deftypefn

## Author: grasingerm <grasingerm@grasingerm-np5xnp6xnp7xpnkpnhpnj>
## Created: 2025-04-02

function [x, y, conn, f_elems, bc_nodes] = mesh_beam8(h, l, n)
  elem_size = double(h / n);
  elems_per_row = int32(l / elem_size);
  m1 = 2*elems_per_row + 1;
  m2 = elems_per_row + 1;
  num_elems = n * elems_per_row;
  num_nodes = (m1+m2)*n + m1;
  conn = zeros(num_elems, 8);
  idx = 1;
  for row=0:n-1
    r = row*(m1+m2);
    conn(idx, :) = r + [1 2 3 m1+2 (m1+m2+3) (m1+m2+2) (m1+m2+1) m1+1];
    idx = idx + 1;
    for j=2:elems_per_row
      conn(idx, :) = conn(idx-1, :) + [2 2 2 1 2 2 2 1];
      idx = idx + 1;
    endfor
  endfor

  f_elems = (elems_per_row*(n-1)+1):num_elems;

  x = linspace(0, l, m1)';
  y = zeros(m1, 1);
  for row=1:n
    k = length(y);
    y = [y; zeros(m2, 1) + y(k) + elem_size / 2];
    x = [x; linspace(0, l, m2)'];
    k = length(y);
    y = [y; zeros(m1, 1) + y(k) + elem_size / 2];
    x = [x; linspace(0, l, m1)'];
  endfor

  bc_nodes = [1:(m1+m2):num_nodes (m1+1):(m1+m2):num_nodes];
endfunction
