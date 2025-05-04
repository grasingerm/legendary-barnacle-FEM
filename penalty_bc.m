function Kg = penalty_bc(Kg, bc_nodes, C)

  for i=1:length(bc_nodes)
    bc_idx = bc_nodes(i);
    for M=1:2
      gdof = 2*bc_idx - 2 + M;
      Kg(gdof, gdof) = Kg(gdof, gdof) + C;
    endfor
  endfor

endfunction
