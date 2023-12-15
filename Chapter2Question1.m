%Behrad Bolkhari     Student Number:9919653       Dr Mahdi Imanian
clc
clear
close all

api = 25;
g_o = 141.5/(api+131.5);
Rs = 0;
g_g = 0;
t = 100;
p0 = (62.4*g_o + 0.0136*Rs*g_g)/(0.972 + 0.000147*(Rs*sqrt(g_g/g_o)+1.25*t)^1.175)
