function [] = subsection_d_for_images( B, original , energy_x, energy_y, phi_low, phi_high)
    f_mse = @(x) ((1/12)*(energy_x*((x(1)*x(2))^2)/(B^2))+(1/12)*energy_y/(x(1)^2))+(1/12)*(double((phi_high-phi_low))^2)/(2^(2*x(2)));
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
    X = ['Nx optimal numeric: ', num2str(N_x)];
    disp(X);
    X = ['Ny optimal numeric: ', num2str(floor(x(1)))];
    disp(X);
    X = ['b optimal numeric: ', num2str(floor(x(2)))];
    disp(X);
    X = ['MSE :', num2str(f_mse(floor(x)), '%10.4e\n')];
    disp(X); 
    diff = int16(size(original,1)/N_x);
    phi_xy = original(1:diff:end,:);
    phi_xy = phi_xy(:,1:int16(size(original,2)/floor(x(1))):end);
    uniform_phi = Uniquantization(phi_xy, x(2));
    figure;
    imshow(uniform_phi, [phi_low phi_high]);
    title(['Numeric Result for ', num2str(B, '%10.0e\n'), ' Bit Budget']);


end

