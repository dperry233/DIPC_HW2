omega = 10;
B = 200;
syms b
eqn = (2*b*((pi*omega/B)^2))*((sin(2*pi*omega))^2)+log(2)*(2^(1-2*b))==0;
b = solve(eqn,b);
X = ['For omega = ', num2str(omega), '   N is: ', num2str(floor(B/(real(double(b))))), '   b is: ' , num2str(floor(real(double(b))))];
disp(X);
omega = 1;
syms b
eqn = (2*b*((pi*omega/B)^2))*((sin(2*pi*omega))^2)+log(2)*(2^(1-2*b))==0;
b = solve(eqn,b);
X = ['For omega = ', num2str(omega), '   N is: ', num2str(floor(B/(real(double(b))))), '   b is: ' , num2str(floor(real(double(b))))];
disp(X);