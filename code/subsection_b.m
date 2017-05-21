function [ phi_xy ] = subsection_b ( A, omega_x, omega_y)
continuous_approx_delta = 0.001;
figure;
grid = 0 : continuous_approx_delta : (1+continuous_approx_delta);
[x_grid,y_grid] = meshgrid(grid,grid);
phi_xy=(A/2)*cos(2*pi*omega_x*(x_grid)-2*pi*omega_y*(y_grid))+(A/2)*cos(2*pi*omega_x*(x_grid)+2*pi*omega_y*(y_grid));
imshow(phi_xy, [-5000 5000]);
title('Original Signal');


end

