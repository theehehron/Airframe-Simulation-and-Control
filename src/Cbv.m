function Cbv = Cbv(phi_theta_psi)
%CBV Calcuates the direction cosine matrix given phi, theta, psi

phi     = phi_theta_psi(1);
theta   = phi_theta_psi(2);
psi     = phi_theta_psi(3);

C1v = [ cos(psi) sin(psi)  0
       -sin(psi) cos(psi)  0
        0        0         1];

C21 = [cos(theta)  0  -sin(theta)
       0           1   0
       sin(theta)  0   cos(theta)];

Cb2 = [1  0        0
       0  cos(phi) sin(phi)
       0 -sin(phi) cos(phi)];

Cbv = Cb2*C21*C1v;

end

