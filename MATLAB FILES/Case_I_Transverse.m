%%%MATLAB file to generate theoretical results presented in the paper
%%%entitled "Modeling Extracellular Electrical Stimulation II:
%%%Computational Validation and Numerical Results".

%Developed at Bionic Vision Australia, Centre for Neural Engineering, The University of
%Melbourne, August 2012.

%%%Figure 7.  Analytic results of the membrane potential for  transverse
%%%modes  of  stimulation,  n0 =  1  and  n0 =  2  with  current  density
%%%boundary  conditions  given  by  Equation  (12)

clc
clear all
Fs=20;%Font size for figures

a = 1e-6;
d = 0.05e-6;
b = a + d;

RM = .1;
rho_e = 1;
rho_i = 1;


z = [-400:400]*1e-6;

r_e = rho_e/(b^2-a^2)/pi;
r_i = rho_i/a^2/pi;
rm = RM/2/pi/a;

LamdaTheory = sqrt(rm/(r_e+r_i));
LamdaTheoryV = sqrt(rm/r_i);



Sig = 10e-6;

JA = 5;
gz = 1/sqrt(2*pi*Sig^2)*exp(-z.^2/2/Sig^2);
Magnitude1 = JA*rho_e*b^2*gz/1/d;


myPlot1 = figure(7);
set(myPlot1,'Position',[50,100,1200,850]);

subplot(2,1,1)
Sz = length(z)/2;
plot(1e6*z,1*Magnitude1,'b','linewidth',2);
set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
xlabel({'z[$\mu$m]','(a)'}, 'Interpreter','latex');
ylabel('${V}_\mathrm{M}^1$[mV]', 'Interpreter','latex');
axis([-50 50 0 5.5])
legend('Analytic')

subplot(2,1,2)



Magnitude2 = JA*rho_e*b^2*exp(-abs(z.^2)/2/Sig^2)/(4*sqrt(2*pi)*Sig*d);

plot(1e6*z,1*Magnitude2,'b','linewidth',2);
set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
xlabel({'z[$\mu$m]','(b)'}, 'Interpreter','latex');
ylabel('${V}_\mathrm{M}^2$[mV]', 'Interpreter','latex');
axis([-50 50 0 1.5])
legend('Analytic')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Figure 8. Analytic results for the membrane
%%%potential as a function of d/a.

clc
clear all
Fs=20;%Font size for figures


a = 1e-6;
b = [1.05:0.05:2]*1e-6;
d = b-a;

RM = .1;
rho_e = 1;
rho_i = 1;


r_e = rho_e./(b.^2-a^2)/pi;
r_i = rho_i/a^2/pi;

rm = RM/2/pi/a;


Sig = 1e-6;

Magnitude1 = rho_e*b.^2./(2*sqrt(2*pi)*Sig*d);

myPlot1 = figure(8);
set(myPlot1,'Position',[50,100,1200,600]);
h = plot(d./a,Magnitude1,'x');
set(h(1),'LineWidth',2);
set(h(1),'MarkerSize',6)
xlabel({'$d/a $'},'Interpreter','latex');
ylabel('$V_{\mathrm{M_{max}}}^1$[mV]','Interpreter','latex');
axis([0 .5 0 5])
set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);

legend('Analytic');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Figure 9. Analytic results of the membrane potentialfor transverse
%%% mode of stimulation as a function of b/? under current density boundary
%%%conditions.
clear all
clc
Fs=20;%Font size for figures

a = 1e-6;
d = 0.05e-6;
b = a + d;

RM = .1;
rho_e = 1;
rho_i = 1;

r_e = rho_e./(b.^2-a.^2)/pi;
r_i = rho_i./a.^2/pi;
rm = RM/2/pi/a;

Sig = 0.5*b*2.^[0:5];

Magnitude1 =  1*rho_e*b.^2./(1*sqrt(2*pi)*Sig*d);

myPlot1 = figure(9);
set(myPlot1,'Position',[50,100,1000,550])


h = plot(5*Magnitude1,'x');


set(h(1),'LineWidth',2);
set(h(1),'MarkerSize',6);

xlabel({'$b/\sigma$'},'Interpreter','latex');

ylabel('$V_{\mathrm{M_{max}}}^1$[mV]','Interpreter','latex');

set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
set(gca,'XTick',[1:6]);
set(gca,'XTickLabel',1./(0.5*2.^[0:5]));
set(gca, 'XDir', 'reverse')
legend('Analytic')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Figure 10.  Case  I:  The  analytic  value  of  V1Mmax using
%%%Equation (17a)  and  the  simulated  value  of  V1Mmax.

clear all
clc
Fs=20;%Font size for figures

w = 10.^[-1:.1:5];
a = 1e-6;
d = 5e-8;
b = a + d;

RM = .1;
CM = .01;
rho_e = 1;
rho_i = 1;

r_e = rho_e./(b.^2-a.^2)/pi;
r_i = rho_i./a.^2/pi;

n = 1;

sigma = 10e-6;
Ja = .1/sqrt(2*pi)/sigma;

ZM =1*(j.*w*CM+1/RM + n^2*d/(rho_e*b^2)).^(-1);

VM = abs(ZM*Ja)/1;


myPlot1 = figure(10);
set(myPlot1,'Position',[50,100,1000,650]);
plot(log10(w),VM,'b','linewidth',2);

xlabel('$\log\omega$[rad/s]','Interpreter','latex');
ylabel('$V_{\mathrm{M_{max}}}^1$[mV]','Interpreter','latex');


set(gca,'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
 axis([-1 5 0.07 .1])

set(gca,'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
 
 legend('Analytic')

