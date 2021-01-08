# Planetary-atmosphere-calculations
 This repository contains MATLAB scripts to easily calculate planetary atmosphere

 Python scripts will become available as this repository is still in work


## Equations
### Geopotential altitude h as function of geometric altitude h_g, and planet radius r_p
h = r_p*h_g/(r_p + h_g)

### Hydrostatic eq. for isothermal layer
p2_iso = p1*exp(-(go/(R*T))*(h2-h1))
rho2_iso = rho1*exp(-(go/(R*T))*(h2-h1))

## Hydrostatic eq. for gradient layer
p2_grad = p1*(T2/T1)^-(go/aR)
rho2_grad = rho1*(T2/T1)^(-go/(a*R)-1)

## Temperature at gradient later (K)
T2 = T1 + a*(h2-h1)

## Ideal gas law
# p = rho*R*T;

Other units: (Pressure - N/m^2 / Density - kg/m^3)
