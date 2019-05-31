
%%%MATLAB file to generate theoretical results presented in the paper
%%%entitled "Modeling Extracellular Electrical Stimulation II:
%%%Computational Validation and Numerical Results".

%Developed at Bionic Vision Australia, Centre for Neural Engineering, The University of
%Melbourne, August 2012.


clc
clear all
Fs=20;%Font size for figures

a = 1e-6;
b = 1.05e-6;

RM = .1;
rho_e = 1;
rho_i = 1;


z = [-400:400]*1e-6;

r_e = rho_e/(b^2-a^2)/pi;
r_i = rho_i/a^2/pi;
rm = RM/2/pi/a;

LamdaTheory = sqrt(rm/(r_e+r_i));
LamdaTheoryV = sqrt(rm/r_i);


%%%Figure 2. Illustrative  example  of  the  membrane  potential  for  the  longitudinal
%%%component, n0 = 0, under current density boundary conditions for a neurite speci?ed
%%%in Table 3.%%

Magnitude = 0.5*r_e*LamdaTheory*2*pi*b*exp(-abs(z)/LamdaTheory);
Sz = length(z)/2;
myPlot1 = figure(2);
set(myPlot1,'Position',[50,100,1200,600])
plot(z*1e6,.01*Magnitude,'b','linewidth',2);

set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
xlabel('z[$\mu$m]', 'Interpreter','latex');
ylabel('$V_{\mathrm{M}}^0$[mV]', 'Interpreter','latex');
legend('Analytic')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%Figure 3. Analytic results for the longitudinal mode of stimulation with
%%%current density boundary conditions as a function of d/a.
clear all
Fs=20;%

a = 1e-6;
b = 1.05e-6;
d = [.05:.05:1]*1e-6;
b = a + d;
RM = .1;
rho_e = 1;
rho_i = 1;

r_e = rho_e./(b.^2-a.^2)/pi;
r_i = rho_i./a.^2/pi;
rm = RM/2/pi/a;

LamdaTheory = sqrt(rm./(r_e+r_i));
MagnitudeT = 0.5*r_e.*LamdaTheory.*b*2*pi*100;


myPlot1 = figure(3);
set(myPlot1,'Position',[50,100,1200,800])

subplot(2,1,1)
h = plot(d/a,.0001*MagnitudeT,'x');
set(h(1),'LineWidth',2);
set(h(1),'MarkerSize',6)


xlabel({'$d/a $','(a)'},'Interpreter','latex');
ylabel('$V_{\mathrm{M_{max}}}^0$[mV]','Interpreter','latex');


set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);

legend('Analytic')
axis([0 .5 0 8])

subplot(2,1,2)
h = plot(d/a,1e6*LamdaTheory,'x');


set(h(1),'LineWidth',2);
set(h(1),'MarkerSize',6);


xlabel({'$d/a $','(c)'},'Interpreter','latex');
ylabel('$\lambda_{0_\mathrm{J}}$[$\mu$m]','Interpreter','latex');

set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);

legend('Analytic')

axis([0 .5 50 200])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%Figure 4. Analytic results for the longitudinal mode of stimulation with
%%%current density boundary conditions as a function of d/\sigma
clear all
Fs=20;%


a = 1e-6;
d = 0.05e-6;
b = a + d;

Sig = 0.05*1e-6*2.^[0:5];

RM = .1;
rho_e = 1;
rho_i = 1;


r_e = rho_e./(b.^2-a.^2)/pi;
r_i = rho_i./a.^2/pi;

rm = RM/2/pi/a;
z1 = [-500:.01:500]*1e-6;
JA0 =100;

LamdaTheory = sqrt(rm./(r_e+r_i));
MagnitudeT_F = 0.5*r_e.*LamdaTheory.*b*2*pi*100;

for ii = 1: length(Sig)
    gz = 1/sqrt(2*pi*Sig(ii).^2)*exp(-z1.^2/2/Sig(ii).^2);
    JA = JA0*gz;
    H1 = MagnitudeT_F*exp(-abs(z1)/LamdaTheory);
    HH = conv(H1,JA)*1e-10;
    MagnitudeT(ii) = max(HH);
end


myPlot1 = figure(4);
set(myPlot1,'Position',[50,100,1200,800])
subplot(2,1,1)
h = plot(.0001*MagnitudeT,'x');



set(h(1),'LineWidth',2);
set(h(1),'MarkerSize',6)
xlabel({'$d/\sigma$','(a)'},'Interpreter','latex');
ylabel('$V_{\mathrm{M_{max}}}^0$[mV]','Interpreter','latex');
set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
set(gca,'XTick',[1:6]);
set(gca,'XTickLabel',1./(0.5*2.^[0:5]));
legend('Analytic')
set(gca, 'XDir', 'reverse')


subplot(2,1,2)
LamdaTheory = sqrt(rm./(r_e+r_i))*ones(size(Sig));
h = plot(1e6* LamdaTheory,'x');
set(h(1),'LineWidth',2);
set(h(1),'MarkerSize',6);



xlabel({'$d/\sigma$','(c)'},'Interpreter','latex');

ylabel('$\lambda_{0_\mathrm{J}}$[$\mu$m]','Interpreter','latex');


set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);
set(gca,'XTick',[1:6]);
set(gca,'XTickLabel',1./(0.5*2.^[0:5]));
set(gca, 'XDir', 'reverse')
legend('Analytic')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% The  theoretical  value  of  the  frequency  dependent  electrotonic  
%%% length constant, ?J(?). 
clear all
clc
Fs=20;%


a = 1e-6;
d = 5e-8;
b = a + d;

CM = .01;
RM = .1;
rho_e = 1;
rho_i = 1;

TM = RM*CM;

r_e = rho_e./(b.^2-a.^2)/pi;
r_i = rho_i./a.^2/pi;

rm = RM/2/pi/a;
LamdaTheory = 1e6*sqrt(rm./(r_e+r_i));

w = 10.^[1:.1:5];
LW = LamdaTheory./sqrt(1+j*w*TM);


myPlot1 = figure(5);
set(myPlot1,'Position',[100,100,1200,600])



plot(log10(w),0.1*(real(LW)),'b','linewidth',3)

xlabel('log$\omega$[rad/s]','Interpreter','latex');
ylabel('$\lambda_\mathrm{J}(\omega)$[$\mu$m]', 'Interpreter','latex');

set(gca,'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'xlabel'),'FontName','Times New Roman','FontSize',Fs);
set(get(gca,'ylabel'),'FontName','Times New Roman','FontSize',Fs);

legend('Analytic')
