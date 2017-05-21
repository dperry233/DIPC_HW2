function [] = subsection_e_for_images( B, energy_x, energy_y, phi_l, phi_h, original )
% according to mse calculated in class
f_mse = @(N_x, N_y, b) (((1/12)*(energy_x/(N_x^2))+(1/12)*(energy_y/(N_y^2)+(1/12)*((double(phi_h-phi_l))^2)/(2^(2*b)))));
Min = 10e10;
res = [0, 0 , 0];
% search the best option
for i=1:1:size(original, 1)
    for j=1:1:size(original, 2)
        b = floor (B /(i * j));
        mse = f_mse(i, j, b);
        if(Min > mse)
            Min = mse;
            res = [i,  j, b];
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
    diff = int16(size(original,1)/res(1));
phi_xy = original(1:diff:end,:);
phi_xy = phi_xy(:,1:int16(size(original,2)/res(2)):end);
    uniform_phi = Uniquantization(phi_xy, res(3));
    figure;
    imshow(uniform_phi, [phi_l phi_h]);
    title(['Search Result for ', num2str(B, '%10.0e\n'), ' Bit Budget']);