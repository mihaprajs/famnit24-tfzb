% Load or define the empirical function for saturation vapor density
temperature_graph = [-10, 0, 10, 20, 30, 40, 45]; % °C
vapor_density_graph = [2, 7, 9, 15, 31, 52, 70]; % Saturated vapor density values from the graph

% Fit the empirical function to the data
p = polyfit(temperature_graph, vapor_density_graph, 2); % Example with a 2nd-degree polynomial

% Define a function for calculating saturation vapor density
saturation_density = @(T) polyval(p, T);

% Main loop to keep offering options until the user chooses to quit
while true
    % Display options
    disp('Choose a calculation to perform:');
    disp('1 - Calculate Relative Humidity (given absolute vapor density and temperature)');
    disp('2 - Calculate Absolute Vapor Density (given relative humidity and temperature)');
    disp('3 - Calculate Temperature (given absolute vapor density and relative humidity)');
    disp('4 - Quit');
    
    % Get the user's choice
    choice = input('Enter your choice: ');
    
    % Perform the selected calculation or quit
    if choice == 1
        % Calculate Relative Humidity
        abs_density = input('Enter absolute vapor density: ');
        temp = input('Enter temperature (°C): ');
        sat_density = saturation_density(temp);
        rel_humidity = (abs_density / sat_density) * 100;
        fprintf('Relative humidity: %.2f%%\n\n', rel_humidity);
        
    elseif choice == 2
        % Calculate Absolute Vapor Density
        temp = input('Enter temperature (°C): ');
        rel_humidity = input('Enter relative humidity (%%): ');
        sat_density = saturation_density(temp);
        abs_density = (rel_humidity / 100) * sat_density;
        fprintf('Absolute vapor density: %.2f g/m^3\n\n', abs_density);
        
    elseif choice == 3
        % Calculate Temperature with fzero for more accurate results
        abs_density = input('Enter absolute vapor density: ');
        rel_humidity = input('Enter relative humidity (%%): ');

        % Define the function that we want to find the root of
        temperature_function = @(T) (rel_humidity / 100) * saturation_density(T) - abs_density;

        % Use fzero to solve for temperature, starting with an initial guess
        initial_guess = 30; % Start with a reasonable guess within the given range
        [temp, fval, exitflag] = fzero(temperature_function, initial_guess);

        % Check if fzero successfully found a solution
        if exitflag > 0
            fprintf('Temperature: %.2f °C\n\n', temp);
        else
            disp('Unable to find a matching temperature within the range.\n');
        end
        
    elseif choice == 4
        % Quit the program
        disp('Exiting the program.');
        break;
        
    else
        disp('Invalid choice. Please try again.');
    end
end