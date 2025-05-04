% for each dimension ratio
% for each mesh size

E = 70e3;
nu = 0.33;
t = 1.0;

f0s = [1.0; 1.0; 0.1; 1e-5];
hlratios = [1.0; 0.5; 0.1; 0.01];
%hlratios = [1.0; 0.5; 0.1];

nmax = 4;

for p = 1:length(hlratios)
  h = 1;
  l = h / hlratios(p)
  f0 = f0s(p)
  vtip4FI = zeros(nmax, 1);
  vtip4RI = zeros(nmax, 1);
  vtip8FI = zeros(nmax, 1);
  vtip8RI = zeros(nmax, 1);
  for n=1:nmax % number of divisions along the height
    disp(["n = ", num2str(n)])
    disp("Create mesh")
    [x, y, conn, f_elems, bc_nodes] = mesh_beam(h, l, n);
    [x8, y8, conn8, f_elems8, bc_nodes8] = mesh_beam8(h, l, n);

    disp("Compute global stiffness matrix")
    Kg = Kg_4node(D_plane_stress(E, nu), t, x, y, conn, 2);
    %eig_Kg = eig(Kg);

    KgRI = Kg_4node(D_plane_stress(E, nu), t, x, y, conn, 1);
    %eig_KgRI = eig(KgRI)

    Kg8 = Kg_8node(D_plane_stress(E, nu), t, x8, y8, conn8, 3);
    Kg8RI = Kg_8node(D_plane_stress(E, nu), t, x8, y8, conn8, 2);

    disp("Compute global force vector")
    fg = fg_4node(f0, t, x, y, conn, f_elems);
    fg8 = fg_8node(f0, t, x8, y8, conn8, f_elems8);

    disp("Implement boundary conditions")
    C = max(max(Kg)) * 10e3;
    Kg = penalty_bc(Kg, bc_nodes, C);
    %eig_Kg = eig(Kg);

    CRI = max(max(KgRI)) * 10e3;
    KgRI = penalty_bc(KgRI, bc_nodes, CRI);
    %eig_KgRI = eig(KgRI)

    C8 = max(max(Kg8)) * 10e3;
    Kg8 = penalty_bc(Kg8, bc_nodes8, C8);

    C8RI = max(max(Kg8RI)) * 10e3;
    Kg8RI = penalty_bc(Kg8RI, bc_nodes8, C8RI);

    disp("Solve")
    q = Kg \ fg;
    qRI = KgRI \ fg;
    q8 = Kg8 \ fg8;
    q8RI = Kg8RI \ fg8;

    ndofs = length(q);
    vtip4FI(n) = q(ndofs);
    vtip4RI(n) = qRI(ndofs);

    ndofs = length(q8);
    vtip8FI(n) = q8(ndofs);
    vtip8RI(n) = q8RI(ndofs);
  endfor

  disp(["p = ", num2str(p)])
  disp(['filename is plot-', num2str(p)])
  disp("Visualize")
  I = h^4/12;
  analytical_solution = f0 * l^5 / (E*I) * (1/60 - 1/6 + 1/12 - 1/40);
  aseries = ones(nmax, 1)*analytical_solution;
  plot(1:nmax, vtip4FI, 'r-', 1:nmax, vtip4RI, 'b--', 1:nmax, vtip8FI, 'g-.', 1:nmax, vtip8RI, 'kx', 1:nmax, aseries, 'k-')
  legend('4 FI', '4 RI', '8 FI', '8 RI', 'asoln')
  xlabel('# of elements')
  ylabel('q')
  title(['h / l = ', num2str(h/l)])
  ylim([-Inf, 0.0])
  saveas(gcf, ['plot-', num2str(p)], 'png')
endfor
