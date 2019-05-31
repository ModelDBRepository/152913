%%%MATLAB file to generate theoretical results presented in the paper
%%%entitled "Modeling Extracellular Electrical Stimulation II:
%%%Computational Validation and Numerical Results".

%Developed at Bionic Vision Australia, Centre for Neural Engineering, The University of
%Melbourne, August 2012.

clc
clear all
Fs=20;%Font size for figures

%%%Figure 11.  Illustrative  example  of  the  membrane  potential  for
%%%the  longitudinal component,  n0 =  0,  under  the  voltage boundary
%%%condition for  a  neurite  speci?edin Table 3.

a = 1e-6;
b = 1.05e-6;

RM = .1;
rho_e = 1;
rho_i = 1;

Sig=1e-6;

r_e = rho_e/(b^2-a^2)/pi;
r_i = rho_i/a^2/pi;

rm = RM/2/pi/a;
LTJ = sqrt(rm/(r_e+r_i));
LTV = sqrt(rm/r_i);

z1 = [-25:.01:25]*1e-6;

gz = 1/sqrt(2*pi*Sig^2)*exp(-z1.^2/2/Sig^2);
VA0 = 2e-5;
VA = VA0*gz;
Fe= 1e-6*exp(-abs(z1)/LTV)/2/LTV;
myPlot1 = figure(11);
set(myPlot1,'Position',[50,100,1100,600])

plot(z1*1e6,-VA+Fe,'b','linewidth',2);

set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
xlabel('z[$\mu$m]', 'Interpreter','latex');
ylabel('$V_\mathrm{M}^0$[mV]', 'Interpreter','latex');
axis([-25 25 -8 .2])
legend('Analytic')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Figure 12. Analytic results as a function of d/a for
%%%voltage  boundary  conditions.


clc
clear all
Fs=20;%Font size for

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


myPlot1 = figure(12);
set(myPlot1,'Position',[50,100,1200,600])


h = plot(d./a,0.1*MagnitudeT,'x');
set(h(1),'LineWidth',2);
set(h(1),'MarkerSize',6)
xlabel({'$d/a $','(a)'},'Interpreter','latex');
ylabel('$V_{\mathrm{M_{max}}}^0$[mV]','Interpreter','latex');
axis([0 0.5 -8 -7])
set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Figure 13. Analytic results of the membrane potential for the
%%%longitudinal mode of stimulation as a function of d/?, under voltage
%%%boundary conditions.
clc
clear all
Fs=20;%Font size for figures

a = 1e-6;
b = 1.05*1e-6;
d = b-a;

RM = .1;
rho_e = 1;
rho_i = 1;

%Sig=1e-6*[.01:.01:.1];
Sig = .5*d*2.^[0:5];

r_e = rho_e./(b.^2-a^2)/pi;
r_i = rho_i/a^2/pi;

rm = RM/2/pi/a;
LTJ = sqrt(rm./(r_e+r_i));
LTV = sqrt(rm/r_i);

z1 = [-25:.01:25]*1e-6;


VA0 = 2e-4;

for ii = 1: length(Sig)
    gz = 1/sqrt(2*pi*Sig(ii).^2)*exp(-z1.^2/2/Sig(ii).^2);
    VA = VA0*gz;
    Fe= 1e-6*exp(-abs(z1)/LTV)/2/LTV;
    MagnitudeT(ii) = min(-VA+Fe);
end


myPlot1 = figure(13);
set(myPlot1,'Position',[50,100,1200,650])
Sig = Sig*1e6;
h = plot(0.1*MagnitudeT,'x');
set(h(1),'LineWidth',2);
set(h(1),'MarkerSize',6)
xlabel({'$d/\sigma$'},'Interpreter','latex');
ylabel('$V_{\mathrm{M_{max}}}^0$[mV]','Interpreter','latex');


set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
set(gca,'XTick',[1:6]);
set(gca,'XTickLabel',1./(0.5*2.^[0:5]))
set(gca, 'XDir', 'reverse')
legend('Analytic')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
