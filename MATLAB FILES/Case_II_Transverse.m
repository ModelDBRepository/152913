%%%MATLAB file to generate theoretical results presented in the paper
%%%entitled "Modeling Extracellular Electrical Stimulation II:
%%%Computational Validation and Numerical Results".

%Developed at Bionic Vision Australia, Centre for Neural Engineering, The University of
%Melbourne, August 2012.

%%%Figure 15. Analytic results of the membrane potential for transverse
%%%modes of stimulation,  n0 =  1 and n0 =  2,  under voltage boundary
%%%conditions. 
clc
clear all
Fs=20;%Font size for figures

a = 1e-6;
b = 1.05*1e-6;
d = b-a;

RM = .1;
rho_e = 1;
rho_i = 1;

a = 1e-6;
b = 1.05e-6;
d = b-a;

RM = .1;
rho_e = 1;
rho_i = 1;


r_e = rho_e/(b^2-a^2)/pi;
r_i = rho_i/a^2/pi;

rm = RM/2/pi/a;
LamdaTheory = sqrt(rm/(r_e+r_i));

Sig = 1e-6;



rm = RM/2/pi/a;
LTJ = sqrt(rm/(r_e+r_i));
LTV = sqrt(rm/r_i);

z1 = [-15:.01:15]*1e-6;



gz = 1/sqrt(2*pi*Sig^2)*exp(-z1.^2/2/Sig^2);
VA0 = 2e-4;
VA = VA0*gz;
Fe= 1e-6*exp(-abs(z1)/LTV)/2/LTV;

Magnitude1 = -VA+Fe;


myPlot1 = figure(15);
set(myPlot1,'Position',[50,100,1200,800])
subplot(2,1,1)

plot(1e6*z1,.1*Magnitude1,'b','linewidth',2);

set(gca,'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
xlabel({'z[$\mu$m]','(a)'}, 'Interpreter','latex');
ylabel('${V}_\mathrm{M}^1$[mV]', 'Interpreter','latex');
axis([-15 15 -8 1])
legend('Analytic')

subplot(2,1,2)
plot(1e6*z1,0.1*Magnitude1,'b','linewidth',2);
set(gca,'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
xlabel({'z[$\mu$m]','(b)'}, 'Interpreter','latex');
ylabel('${V}_\mathrm{M}^2$[mV]', 'Interpreter','latex');
axis([-15 15 -8 1])
legend('Analytic')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Figure 16. Comparison of analytic and numerical results of the membrane
%%%potential for  transverse  mode  of  stimulation  as  a  function  of  
%%%d/a  under  voltage  boundary%conditions speci?ed by Equation (18).
clc
clear all
Fs=20;%Font size for figures

a = 1e-6;
b = [1.05:0.05:2]*1e-6;
d = b-a;

RM = .1;
rho_e = 1;
rho_i = 1;

Sig=1e-6;

r_e = rho_e./(b.^2-a^2)/pi;
r_i = rho_i/a^2/pi;

rm = RM/2/pi/a;
LTJ = sqrt(rm./(r_e+r_i));
LTV = sqrt(rm/r_i);

z1 = [-25:.01:25]*1e-6;



gz = 1/sqrt(2*pi*Sig^2)*exp(-z1.^2/2/Sig^2);
VA0 = 2e-4;
VA = VA0*gz;
Fe= 1e-6*exp(-abs(z1)/LTV)/2/LTV;

MagnitudeT = min(-VA+Fe)*ones(1,length(b));


myPlot1 = figure(16);
set(myPlot1,'Position',[50,100,1200,800])

h = plot(d./a,.1*MagnitudeT,'x')
set(h(1),'LineWidth',2);
set(h(1),'MarkerSize',6)
xlabel({'$d/a $'},'Interpreter','latex');
ylabel('$V_{\mathrm{M_{max}}}^1$[mV]','Interpreter','latex');
axis([0 0.5 -8 -5])
set(gca,'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
 
 legend('Analytic')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
Fs=20;%Font size for f
a = 1e-6;
b = 1.05*1e-6;
d = b-a;

RM = .1;
rho_e = 1;
rho_i = 1;

Sig = 0.5*d*2.^[0:5];

r_e = rho_e./(b.^2-a^2)/pi;
r_i = rho_i/a^2/pi;

rm = RM/2/pi/a;
LTJ = sqrt(rm./(r_e+r_i));
LTV = sqrt(rm/r_i);

z1 = [-25:.01:25]*1e-6;


VA0 = 20e-4;

for ii = 1: length(Sig)
gz = 1/sqrt(2*pi*Sig(ii).^2)*exp(-z1.^2/2/Sig(ii).^2);
VA = VA0*gz;
Fe= 1e-6*exp(-abs(z1)/LTV)/2/LTV;
MagnitudeT(ii) = min(-VA);
end


myPlot1 = figure(17);
set(myPlot1,'Position',[50,100,1200,700])


Sig = Sig*1e6;

h = plot(.01*MagnitudeT,'x')
set(h(1),'LineWidth',2);
set(h(1),'MarkerSize',6)

xlabel({'$d/\sigma$'},'Interpreter','latex');
ylabel('$V_{\mathrm{M_{max}}}^1$[mV]','Interpreter','latex');

set(gca,'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
 set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
  set(gca,'XTick',[1:6]);
 set(gca,'XTickLabel',1./(0.5*2.^[0:5]))
 set(gca, 'XDir', 'reverse')
  legend('Analytic')
 
