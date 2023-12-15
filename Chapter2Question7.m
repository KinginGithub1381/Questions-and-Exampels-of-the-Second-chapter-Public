%Behrad Bolkhari     Student Number:9919653       Dr Mahdi Imanian
clc
clear
close all

tc = 40;
tf = 1.8*tc + 32;
g_o = 0.8;
Rs = 0;
g_g = 0;

p0 = (62.4*g_o + 0.0136*Rs*g_g)/(0.972 + 0.000147*(Rs*sqrt(g_g/g_o)+1.25*tf)^1.175)
