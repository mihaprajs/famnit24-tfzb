% HW2

%% task a)
% Because η is defined as velocity of the river over velocity of the boat it means that there are three cases.
% Case #1: η < 1: This means that the boat is faster than the river. The boat needs to steer slightly upstream to compensate for slower river.
% Case #2: η = 1: This means that the boat is as fast as the river. The boat will need to steer at an angel that is not to extreme.
% Case #3: η > 1: This means that the boat is slower than the river. The boat needs to steer at mostly upstream, because the river is puhing it downstream.

%% task b)
syms alpha
eta_value = [1.5,2.0,2.5,3.0];
L = 1; % river width
for eta = eta_value
    d_alpha = L * cos(alpha) / sin(alpha) + L * eta / sin(alpha); % define function (L could be skipped as it is set to 1)
    d_alpha_derivative = diff(d_alpha, alpha); % get the derivative of the function
    optimal_alpha = solve(d_alpha_derivative == 0, alpha); 
    optimal_value = eval(optimal_alpha); % get numeric value - because it is an array of two numbers I'm using only the one on the 1st index
    fprintf('Optimal angle for η = %.1f: %.2f°\n', eta, rad2deg(optimal_value(2))); % using rad2deg to get the number in degrees
end

%% task c)
distance = @(alpha, eta) L * (cos(alpha) ./ sin(alpha)) + (L * eta ./ sin(alpha)); % defining function to be used for ploting
alpha_values = linspace(0.01, pi-0.01, 100); % avoid division by 0

% graph
alphas = linspace(0.01, pi, 500);  % Alpha angles in radians

figure;
hold on;

colors = {'k', 'b', 'r', 'y'};  
optimal_alphas = [132, 120, 114, 109];  % Approximate optimal angles for eta= {1.5, 2.0, 2.5, 3.0} in degrees (retyped from terminal)
optimal_alphas_rad = deg2rad(optimal_alphas);  % Convert to radians

for i = 1:length(eta_value)
    eta = eta_value(i);
    distances = distance(alphas, eta);
    plot(alphas, distances, colors{i}, 'LineWidth', 2);
end

xlabel('\alpha');
ylabel('Distance');
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({'0', '\pi/4', '\pi/2', '3\pi/4', '\pi'});
ylim([0 4]);

grid on;
hold off;

%% task d)
eta_val = 2; % value assigned in pdf
alpha_val = 120; % value assigned in pdf

d_val = L * cosd(alpha_val) / sind(alpha_val) + L * eta_val / sind(alpha_val); % Calculate the distance d(α)

disp(['Distance for η = 2 and α = 120°: ', num2str(d_val)]);