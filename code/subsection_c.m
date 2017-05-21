function [ Sx, Sy, phi_low, phi_high ] = subsection_c( phi_xy, isImage )
continuous_approx_delta = 0.001;
if ( isImage)
    continuous_approx_delta = 1 / sqrt(numel(phi_xy));
end
phi_low = min(min(phi_xy));
phi_high = max(max(phi_xy));
Sx = 0;
grid = 0 : continuous_approx_delta : (1+(~isImage)*continuous_approx_delta);
% calculate energy x'
for i=1:1:numel(grid) - (isImage)
    for j=1:1:numel(grid)-1 - (isImage)
        d = double(phi_xy(i,j+1) - phi_xy(i,j)) ./ continuous_approx_delta;
        Sx = Sx +(d.^2)*(continuous_approx_delta.^2);
    end
end
Sy=0;
% calculate energy y'
for j=1:1:numel(grid) - (isImage)
    for i=1:1:numel(grid)-1 - (isImage)
        d = double(phi_xy(i+1,j) - phi_xy(i,j)) ./ continuous_approx_delta;
        Sy = Sy +((d.^2)*(continuous_approx_delta.^2));
    end
end
X = ['Value range: ', num2str(phi_high-phi_low, '%10.3e\n')];
disp(X);
X = ['Horizontal drivative energy: ', num2str(Sx, '%10.3e\n')];
disp(X);
X = ['Vertical drivative energy: ', num2str(Sy, '%10.3e\n')];
disp(X);

end

