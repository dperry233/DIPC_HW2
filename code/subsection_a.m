function [ energy_x, energy_y, phi_l, phi_h ] = subsection_a( A, omega_x, omega_y )
px = @(x,y) ((2*pi*A*omega_x).^2) * (sin(2*pi*omega_x*x).^2) .* (cos(2*pi*y*omega_y).^2);
py = @(x,y) ((2*pi*A*omega_y).^2) * (sin(2*pi*omega_y*y).^2) .* (cos(2*pi*x*omega_x).^2);
% derivatives energy
energy_x = integral2(px,0, 1,0,1);
energy_y = integral2(py,0, 1,0,1);
phi_h = A;
phi_l = -A;
X = ['Value range: ', num2str(phi_h-phi_l, '%10.3e\n')];
disp(X);
X = ['Horizontal drivative energy: ', num2str(energy_x,'%10.4e\n')];
disp(X);
X = ['Vertical drivative energy: ', num2str(energy_y, '%10.4e\n')];
disp(X);

end

