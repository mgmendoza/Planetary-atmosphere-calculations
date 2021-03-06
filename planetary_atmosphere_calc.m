
clear
clc
% Specific gas constants [J/kg-K]
R_earth = 287;
R_mars = 188.92;
R_venus = 188.92;

% Planet radii [m]
r_earth = 6378.14e3;
r_mars = 3397.2e3;
r_venus = 6051.8e3;

% Gravitational acceleration at planet surface [m/s2]
g_earth = 9.8;
g_mars = 3.8;
g_venus = 8.9;

% %Equations
% % Geopotential altitude h as function of geometric altitude h_g, and planet radius r_p
% h = r_p*h_g/(r_p + h_g);
% 
% % Hydrostatic eq. for isothermal layer
% p2_iso = p1*exp(-(go/(R*T))*(h2-h1));
% rho2_iso = rho1*exp(-(go/(R*T))*(h2-h1))
% 
% % Hydrostatic eq. for gradient layer 
% p2_grad = p1*(T2/T1)^-(go/aR);
% rho2_grad = rho1*(T2/T1)^(-go/(a*R)-1)

% % Temperature at gradient later (K)
% T2 = T1 + a*(h2-h1)
% 
% % Ideal gas law
% p = rho*R*T;
%
% Other units: (Pressure - N/m^2 / Density - kg/m^3)
%% Problem 3

% First getting conditions at geopotential altitude h2
Mars.Properties.VariableNames = {'h_g','h','T','P','rho'};
Mars.h_g = [0;20000;40000;55000];
Mars.h(1) = 0;
Mars.h(2) = r_mars*Mars.h_g(2)/(r_mars + Mars.h_g(2));
Mars.h(3) = r_mars*Mars.h_g(3)/(r_mars + Mars.h_g(3));
Mars.h(4) = r_mars*Mars.h_g(4)/(r_mars + Mars.h_g(4));
Mars.T(4) = 150;
Mars.T(1) = 230;
Mars.T(3) = 150;

am = (Mars.T(3)-Mars.T(1))/(Mars.h(3)-Mars.h(1));
Mars.T(2)= Mars.T(1) + am *(Mars.h(2)-Mars.h(1));

Mars.P(1) = 7.50e2;
Mars.P(2) = Mars.P(1)*(Mars.T(2)/Mars.T(1))^(-g_mars/(am*R_mars));
Mars.P(3) = Mars.P(1)*(Mars.T(3)/Mars.T(1))^(-g_mars/(am*R_mars));
%isothermal layer
Mars.P(4) = Mars.P(3)*exp(-(g_mars/(R_mars*Mars.T(4)))*(Mars.h(4)-Mars.h(3)));

Mars.rho(1) = Mars.P(1)/(R_mars*Mars.T(1));
%gradient
Mars.rho(2) = Mars.rho(1)*(Mars.T(2)/Mars.T(1))^(-g_mars/(am*R_mars)-1);
Mars.rho(3)= Mars.rho(1)*(Mars.T(3)/Mars.T(1))^(-g_mars/(am*R_mars)-1);
%isothermal
Mars.rho(4) = Mars.rho(3)*exp(-(g_mars/(R_mars*Mars.T(4)))*(Mars.h(4)-Mars.h(3)));

%% Problem 4

% First getting conditions at geopotential altitude h2
Venus.Properties.VariableNames = {'h_g','h','T','P','rho'};
Venus.h_g = [0;20000;40000;55000];
Venus.h(1) = 0;
Venus.T(1) = 735;
Venus.T(4)= 294.64;
Venus.h(2) = r_venus*Venus.h_g(2)/(r_venus + Venus.h_g(2));
Venus.h(3) = r_venus*Venus.h_g(3)/(r_venus + Venus.h_g(3));
Venus.h(4) = r_venus*Venus.h_g(4)/(r_venus + Venus.h_g(4));

av = (Venus.T(4)-Venus.T(1))/(Venus.h(4)-Venus.h(1));
Venus.T(2)= Venus.T(1) + av*(Venus.h(2)-Venus.h(1));
Venus.T(3)= Venus.T(1) + av*(Venus.h(3)-Venus.h(1));
Venus.T(4)= Venus.T(1) + av*(Venus.h(4)-Venus.h(1));

Venus.P(1) = 9.5e6;
Venus.P(2) = Venus.P(1)*(Venus.T(2)/Venus.T(1))^(-g_venus/(av*R_venus));
Venus.P(3) = Venus.P(1)*(Venus.T(3)/Venus.T(1))^(-g_venus/(av*R_venus));
Venus.P(4) = Venus.P(1)*(Venus.T(4)/Venus.T(1))^(-g_venus/(av*R_venus));

Venus.rho(1) =  Venus.P(1)/(R_venus*Venus.T(1));
Venus.rho(2) = Venus.rho(1)*(Venus.T(2)/Venus.T(1))^(-g_venus/(av*R_venus)-1);
Venus.rho(3) = Venus.rho(1)*(Venus.T(3)/Venus.T(1))^(-g_venus/(av*R_venus)-1);
Venus.rho(4) = Venus.rho(1)*(Venus.T(4)/Venus.T(1))^(-g_venus/(av*R_venus)-1);


%%Problem 5 - Ratios
Earth.Properties.VariableNames = {'h_g','h','T','P','rho'};
Earth.h_g = [0;20000;40000;55000];
Earth.h = [0,19.937,39.75,54.528];
Earth.T = [288.16,216.66,260.91,275.78];
Earth.P = [1.01325e5,5.5293e3,2.9977e2,4.8373e1];
Earth.rho = [1.225,8.8909e-2,4.0028e-3,6.1108e-4];
rho_mars_earth = Mars.rho./Earth.rho
rho_venus_earth = Venus.rho./Earth.rho
rho_venus_mars = Venus.rho./Mars.rho

