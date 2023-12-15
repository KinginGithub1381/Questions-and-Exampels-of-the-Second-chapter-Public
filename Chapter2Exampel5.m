%Behrad Bolkhari     Student Number:9919653       Dr Mahdi Imanian
clc
clear
close all
g_g = 0.7;
p = 2000;
t = 200;
yN2 = 0.05; yCO2 = 0.05; yH2S = 0.02;
Ppc = 678 - 50 *(g_g-0.5)-206*yN2+440*yCO2+606.7*yH2S
Tpc = 326 +315.7 *(g_g-0.5)-240*yN2-83.3*yCO2+133.3*yH2S
Ppr = p/Ppc;
Tpr = (t+460.2)/Tpc;
tr = 1/Tpr;
A2 = 0.06125*tr*exp(-1.2*(1-tr)^2);
B2 = tr*(14.76-9.76*tr+4.58*tr^2);
C2 = tr*(90.7-242.2*tr+42.4*tr^2);
D2 = 2.18 + 2.82*tr;


f = @(Y) ((Y+Y^2+Y^3-Y^4)/(1-Y)^3)-A2*Ppr-B2*Y^2+C2*Y^D2;
h1=1e-4;
h2=2*h1;
Error = inf;
iter = 1;
x0 = A2*Ppr;
x(1)=x0;
fx=feval(f,x0);
while abs(Error)>1e-10
    dfdx=(feval(f,x(iter)+h1)-feval(f,x(iter)-h1))/h2;
    Error=-fx/dfdx;
    x(iter+1)=x(iter)+Error;
    fx= feval(f,x(iter+1));
    iter = iter + 1;
Y = x(iter);
z2 = A2*Ppr/Y;
end
z2
density = 2.7*g_g*p/(z2*(t+460))