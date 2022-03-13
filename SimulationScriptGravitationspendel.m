%%Initialisierung der Parameter
%% Default
clear;
close all;
clc;
%%

%% Pendelmodell-Parameter
m = 30;         % Pendelmasse [kg]
l = 5;          % Pendellänge [m]
g = 9.81;       % Fallbeschleunigung [m/s²]

% Anfangsbedingungen
phi_0 = 45;     % Anfangsauslenkung [°]
omega_0 = 0;    % Anfangswinkelgeschwindigkeit [°/s]
%%
%%Durchführung der Simulation 
[t,x,y] = sim("Gravitationspendel.mdl");

%%
%% Plotten des Ergebnis
%Plotteng von Phi
figure; subplot(2,1,1);
plot(t,y(:,1));
xlabel('Time');
ylabel('\phi (t) [°]');
set(gca,'XTick',0:10:150)
grid("on")
%Plotten omega & alpha
subplot(2,1,2);
h_h1 = plotyy(t,y(:,2),t,y(:,3));
xlabel('Time');
ylabel(h_h1(1),'\omega (t) [°/s]');
ylabel(h_h1(2),'\alpha(t) [°/s²]');
grid("on")
hold on
%Plotten F(omega)
figure;plot(y(:,2),y(:,4))
xlabel('\omega')
ylabel('F_r(\omega) [N]')
grid("on")