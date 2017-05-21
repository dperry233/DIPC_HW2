function [] = subsection_d( B, energy_x, energy_y, phi_low, phi_high, A, omega_x, omega_y )
    f_mse = @(x) (1/12)*((energy_x*((x(1)*x(2))^2))/(B^2)+energy_y/(x(1)^2)+(double(phi_high-phi_low)^2)/(2^(2*x(2))));
    x0 = [1,1];
    A_ = [1,1];
    b = B;
    lb = [1,1];
    ub = [B,B];
    Aeq = [];
    beq = [];
    x = fmincon(f_mse,x0,A_,b,Aeq, beq,lb,ub);
    N_x = floor(B/(x(1)*x(2)));
    X = ['Bit budget: ' , num2str(B)];
    disp(X);
    X = ['Nx optimal nomeric: ', num2str(N_x)];
    disp(X);
    X = ['Ny optimal nomeric: ', num2str(floor(x(1)))];
    disp(X);
    X = ['b optimal nomeric: ', num2str(floor(x(2)))];
    disp(X);
    X = ['MSE :', num2str(f_mse(floor(x)), '%10.4e\n')];
    disp(X);
    figure;
    grid_x = 0:(1/N_x):1;
    grid_y = 0:(1/floor(x(1))):1;
    [x_grid,y_grid] = meshgrid(grid_x,grid_y);
    phi_xy=(A/2)*cos(2*pi*omega_x*(x_grid)-2*pi*omega_y*(y_grid))+(A/2)*cos(2*pi*omega_x*(x_grid)+2*pi*omega_y*(y_grid));
    uniform_phi = Uniquantization(phi_xy, x(2));
    imshow(uniform_phi, [phi_low phi_high]);
    title(['Numeric Result for ', num2str(B, '%10.0e\n'), ' Bit Budget']);
    end

