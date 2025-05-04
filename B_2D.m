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
## @deftypefn {} {@var{retval} =} B (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: grasingerm <grasingerm@grasingerm-np5xnp6xnp7xpnkpnhpnj>
## Created: 2025-04-05

function retval = B_2D(invJ, dN)
  dN_dxi = dN(1, :);
  dN_deta = dN(2, :);
  e = [1 0 0 0; 0 0 0 1; 0 1 1 0];
  JE = [invJ zeros(2, 2); zeros(2, 2) invJ];
  nj = 2*length(dN_dxi);
  NStar = zeros(4, nj);
  NStar(1, 1:2:nj) = dN_dxi(:);
  NStar(2, 1:2:nj) = dN_deta(:);
  NStar(3, 2:2:nj) = dN_dxi(:);
  NStar(4, 2:2:nj) = dN_deta(:);

  retval = e*JE*NStar;
endfunction
