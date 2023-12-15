%Behrad Bolkhari     Student Number:9919653       Dr Mahdi Imanian
clc
clear
close all

g_g = 0.65;
p = [50 500 5000];
t = 350;
yN2 = 0; yCO2 =0; yH2S = 0;
Ppc = 678 - 50 *(g_g-0.5)-206*yN2+440*yCO2+606.7*yH2S;
Tpc = 326 +315.7 *(g_g-0.5)-240*yN2-83.3*yCO2+133.3*yH2S;
Ppr = p/Ppc;
Tpr = (t+460.2)/Tpc;

A1 = 1.39*(Tpr-0.92)^0.5-0.36*Tpr-0.1;
E1 = 9*(Tpr-1);
F1 = 0.3106-0.49*Tpr+0.1824*Tpr^2;
B1 = (0.62-0.23*Tpr)*Ppr + ...
    (0.066/(Tpr-0.86)*Ppr.^2+(0.32*Ppr.^6)/(10^E1));
C1 = 0.132-0.32*log10(Tpr);
D1 = 10^F1;
z1 = A1 + ((1-A1)./exp(B1)) + C1*Ppr.^D1

tr = 1/Tpr;
A2 = 0.06125*tr*exp(-1.2*(1-tr)^2);
B2 = tr*(14.76-9.76*tr+4.58*tr^2);
C2 = tr*(90.7-242.2*tr+42.4*tr^2);
D2 = 2.18 + 2.82*tr;

for j = 1:3
f = @(Y) ((Y+Y^2+Y^3-Y^4)/(1-Y)^3)-A2*Ppr(j)-B2*Y^2+C2*Y^D2;
h1=1e-4;
h2=2*h1;
Error = inf;
iter = 1;
x0 = A2*Ppr(j);
x(1)=x0;
fx=feval(f,x0);
while abs(Error)>1e-10
    dfdx=(feval(f,x(iter)+h1)-feval(f,x(iter)-h1))/h2;
    Error=-fx/dfdx;
    x(iter+1)=x(iter)+Error;
    fx= feval(f,x(iter+1));
    iter = iter + 1;
end
Y = x(iter);
z2(j) = A2*Ppr(j)/Y;
end
z2
%نتیجه می گیریم این دو معادله در فشار های بالا نسبت به هم همگرا نبوده و قادر به محاسبه دقیق ضریب تراکم پذیری نخواهیم بود و باید از معادلات دیگری استفاده کنیم