%Behrad Bolkhari     Student Number:9919653       Dr Mahdi Imanian
clc
clear
close all

Data = [
    0673 16.040 0.755 0344
    0709 30.070 0.083 0550
    0618 44.100 0.021 0666
    0530 58.120 0.006 0733
    0551 58.120 0.002 0766
    0482 72.150 0.003 0830
    0485 72.150 0.008 0847
    0434 86.180 0.001 0915
    0361 114.23 0.001 1024
    0227 28.020 0.050 0492
    1073 44.010 0.030 0548
    0672 34.080 0.020 1306];

MWa = sum(Data(:,3).*Data(:,2))

g_g = MWa/28.97
Ppc = sum(Data(:,3).*Data(:,1));
Tpc = sum(Data(:,3).*Data(:,4));

A = Data(end,3) + Data(end-1,3);
B = Data(end,3);
e_3 = 120*(A^0.9-A^1.6)+15*(B^0.5-B^4);
Tp_pc = Tpc-e_3
Pp_pc = (Ppc*Tp_pc)/(Tpc+B*(1-B)*e_3)
