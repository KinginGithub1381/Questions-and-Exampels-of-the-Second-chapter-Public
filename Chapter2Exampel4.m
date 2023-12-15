%Behrad Bolkhari     Student Number:9919653       Dr Mahdi Imanian
clc
clear
close all

g_g = 0.7;
p = 2900;
t = 212;
yN2 = 0.05; yCO2 = 0.03; yH2S = 0.02;
Ppc = 678 - 50 *(g_g-0.5)-206*yN2+440*yCO2+606.7*yH2S
Tpc = 326 +315.7 *(g_g-0.5)-240*yN2-83.3*yCO2+133.3*yH2S
Ppr = p/Ppc;
Tpr = (t+460.2)/Tpc;

A1 = 1.39*(Tpr-0.92)^0.5-0.36*Tpr-0.1
E1 = 9*(Tpr-1)
F1 = 0.3106-0.49*Tpr+0.1824*Tpr^2
B1 = (0.62-0.23*Tpr)*Ppr+((0.066/(Tpr-0.86)-0.037)*Ppr.^2+(0.32*Ppr.^6)/(10^E1))
    
C1 = 0.132-0.32*log10(Tpr)
D1 = 10^F1
z1 = A1 + ((1-A1)./exp(B1)) + C1*Ppr.^D1

