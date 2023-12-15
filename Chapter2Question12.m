%Behrad Bolkhari     Student Number:9919653       Dr Mahdi Imanian
clc
clear
close all

g_g = 0.65;
t = 232;
p = 14.7:1:4410;
Ppc = 678 - 50 *(g_g-0.5);
Ppr = p/Ppc;
plot(p,Ppr,'LineWidth',2)
grid on
