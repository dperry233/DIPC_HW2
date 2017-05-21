close all;
clear all;
clc;

[ energy_x, energy_y, phi_l, phi_h ] = subsection_a(5000, 5, 2);
phi_xy = subsection_b (5000, 5, 2);
[ energy_x_nomeric, energy_y_nomeric, phi_l_nomeric, phi_h_nomeric ] = subsection_c(phi_xy, false);
subsection_d(5000, energy_x_nomeric, energy_y_nomeric, phi_l_nomeric, phi_h_nomeric, 5000, 5, 2);
subsection_d(50000, energy_x_nomeric, energy_y_nomeric, phi_l_nomeric, phi_h_nomeric, 5000, 5, 2);
subsection_e(5000, energy_x, energy_y, phi_l, phi_h, 5000, 5, 2);
subsection_e(50000, energy_x, energy_y, phi_l, phi_h, 5000, 5, 2);