%Behrad Bolkhari     Student Number:9919653       Dr Mahdi Imanian
clc
clear
close all

g_g = 0.7;
p = [100 1000 5000 10000];
t = 200;
Ppc = 678 - 50 *(g_g-0.5);
Tpc = 326 +315.7 *(g_g-0.5);
Ppr = p/Ppc;
Tpr = (t+460.2)/Tpc;
u1HC = 8.188e-3-6.15e-3*log10(g_g) + (1.709e-5-2.062e-6*g_g)*t;
yN2 = 0; yCO2 = 0;  yH2S= 0;
uN2 = (9.59e-3+8.48e-3*log10(g_g))*yN2

uCO2 = (6.24e-3-9.08e-3*log10(g_g))*yCO2
uH2S = (3.73e-3+8.49e-3*log10(g_g))*yH2S
u1 = u1HC


a0 = -2.46211820;
a1 = 2.97054714;
a2 = -0.28626405;
a3 = 0.00805420;
a4 = 2.80860949;
a5 = -3.49803305;
a6 = 0.36037302;
a7 = -0.01044324;
a8 = -0.79338568;
a9 = 1.39643306;
a10 = -0.14914493;
a11 = 0.00441016;
a12 = 0.08393872;
a13 = -0.18640885;
a14 = 0.02033679;
a15 = -0.00060958;
ur = a0 + a1*Ppr+a2*Ppr.^2+a3*Ppr.^3+...
    Tpr*(a4+a5*Ppr+a6*Ppr.^2+a7*Ppr.^3)+...
    Tpr.^2*(a8+a9*Ppr+a10*Ppr.^2+a11*Ppr.^3)+...
    Tpr.^3*(a12+a13*Ppr+a14*Ppr.^2+a15*Ppr.^3);
ug = (u1/Tpr)*exp(ur)