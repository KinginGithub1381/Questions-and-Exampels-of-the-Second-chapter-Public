%Behrad Bolkhari     Student Number:9919653       Dr Mahdi Imanian
clc
clear
close all
api = 35;
g_o = 141.5/(api+131.5);
Rs = 600;
g_g = 0.77;
t = 140;
a = Rs*(2.2e-7*Rs -7.4e-4);
c = 8.62e-5*Rs;
d = 1.1e-3*Rs;
e = 3.74e-3*Rs;
p = 4475;
pb = 2745;
b = (0.68/10^c)+(0.25/10^d)+(0.062/10^e);
p0 = (62.4*g_o + 0.0136*Rs*g_g)/(0.972 + 0.000147*(Rs*sqrt(g_g/g_o)+1.25*t)^1.175)
A = 10^(0.43+8.33/api)
uod = (0.32+1.8e7/api^4.53)*(360/(t+200))^A
uob = 10^a*uod^b
uo = uob + 0.001*(p-pb)*(0.024*uob^1.6+0.38*uob^0.56)

