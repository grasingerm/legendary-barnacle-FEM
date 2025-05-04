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
## @deftypefn {} {@var{retval} =} n_quad_wap (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: grasingerm <grasingerm@grasingerm-np5xnp6xnp7xpnkpnhpnj>
## Created: 2025-04-07

function [gps, wts] = n_quad_wap(n)
  load gauss_weights_and_points.mat
  if n == 1
    gps = _GP1_;
    wts = _WT1_;
  elseif n == 2
    gps = _GP2_;
    wts = _WT2_;
  elseif n == 3
    gps = _GP3_;
    wts = _WT3_;
  elseif n == 4
    gps = _GP4_;
    wts = _WT4_;
  elseif n == 5
    gps = _GP5_;
    wts = _WT5_;
  endif
endfunction
