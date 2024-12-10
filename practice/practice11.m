%% Practice 11

clear all

benzene = readtable("benzene.dat");
data = table2array(benzene(:,2:5));
atoms = benzene(:,1);

% find the min/max coordinates
xmin = min(data(:,1));
xmax = max(data(:,1));
ymin = min(data(:,2));
ymax = max(data(:,2));

% calculating electrostatic potencial
Eps0 = 8.8*10^-12;
K = 1/(4*pi*Eps0);
e0=1.6E-19;
[xg, yg] = meshgrid(-3.5:0.1:3.5);
r = 1;

% Calculate the electrostatic potential at each point on the grid
V = zeros(size(xg));
for i = 1:length(data)
    x = data(i,1);
    y = data(i,2);
    q = data(i,4);
    V = V + K * q ./ sqrt((xg - x).^2 + (yg - y).^2);
end

% Plot the electrostatic potential
figure;
contourf(xg, yg, V, 50, ":");
colorbar;
title('Electrostatic Potential around Benzene Molecule');
axis equal;
% Plot the electrostatic potential using contour
figure;
contour(xg, yg, V, 50);
colorbar;
title('Electrostatic Potential around Benzene Molecule (Contour)');
xlabel('x');
ylabel('y');
axis equal;

% Calculate the electrostatic potential in 3D space
[zg, xg, yg] = meshgrid(-3.5:0.1:3.5);
V3D = zeros(size(xg));
for i = 1:length(data)
    x = data(i,1);
    y = data(i,2);
    z = data(i,3);
    q = data(i,4);
    V3D = V3D + K * q ./ sqrt((xg - x).^2 + (yg - y).^2 + (zg - z).^2);
end

% Plot the electrostatic potential using isosurface
figure;
isosurface(xg, yg, zg, V3D, 1e-5); % positive isosurface
isosurface(xg, yg, zg, V3D, -1e-5); % negative isosurface
isosurface(xg, yg, zg, V3D, 0); % zero isosurface
colorbar;
