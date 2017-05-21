function [] = subsection_e( B, energy_x, energy_y, phi_l, phi_h, A, omega_x, omega_y )
% according to mse calculated in class
f_mse = @(N_x, N_y, b) (1/12)*(energy_x/(N_x^2)+energy_y/(N_y^2)+double((phi_h-phi_l)^2)/(2^(2*b)));
Min = 10e10;
res = [0, 0 , 0];
N_ys = 1:1:B;
% search the best option
for i=1:1:numel(N_ys)
    N_xs = 1:1:(B/N_ys(i));
    for j=1:1:numel(N_xs)
        b = floor (B /(N_ys(i) * N_xs(j)));
        mse = f_mse(N_xs(j), N_ys(i), b);
        if(Min > mse)
            Min = mse;
            res = [N_xs(j),  N_ys(i), b];
        end
    end
end
    X = ['Bit budget: ' , num2str(B)];
    disp(X);
    X = ['Nx optimal: ', num2str(res(1))];
    disp(X);
    X = ['Ny optimal: ', num2str(res(2))];
    disp(X);
    X = ['b optimal: ', num2str(res(3))];
    disp(X);
    X = ['MSE :', num2str(Min, '%10.4e\n')];
    disp(X);
% show the best option res(1) is N_x res(2) is N_y res(3) is bits num
figure;
grid_x = 0:(1/res(1)):1;
grid_y = 0:(1/res(2)):1;
[x_grid,y_grid] = meshgrid(grid_x,grid_y);
phi_xy=(A/2)*cos(2*pi*omega_x*(x_grid)-2*pi*omega_y*(y_grid))+(A/2)*cos(2*pi*omega_x*(x_grid)+2*pi*omega_y*(y_grid));
uniform_phi = Uniquantization(phi_xy, res(3));
imshow(uniform_phi, [phi_l phi_h]);
title(['Search Result for ', num2str(B, '%10.0e\n'), ' Bit Budget']);


end

