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

function [x, y, conn, f_elems, bc_nodes] = mesh_beam(h, l, n)
  elem_size = double(h / n);
  elems_per_row = int32(l / elem_size);
  m = elems_per_row + 1;
  num_elems = n * elems_per_row;
  conn = zeros(num_elems, 4);
  elem_idx = 1;
  for row=0:n-1
    for i=1:elems_per_row
      r = elem_idx + row;
      conn(elem_idx, :) = [r (r+1) (r+m+1) (r+m)];
      elem_idx += 1;
    endfor
  endfor
  f_elems = (elems_per_row*(n-1)+1):num_elems;

  num_node_rows = n + 1;
  num_nodes = m * num_node_rows;
  x = zeros(num_nodes, 1);
  y = zeros(num_nodes, 1);
  for i=1:m
    x(i:m:num_nodes) = double(i-1) * elem_size;
  endfor
  for i=1:num_node_rows
    y( (1+(i-1)*m):(i*m) ) = double(i-1) * elem_size;
  endfor

  bc_nodes = 1:m:num_nodes;
endfunction
