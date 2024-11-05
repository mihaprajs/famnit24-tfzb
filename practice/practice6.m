%% Practice 6

% Humidity functions from class
tempFromGrpah = [-10,0,10,20,29,41,46].';
humidityFromGraph = [2,7,10,15,31,51,70].';

[f2, fo] = fit(tempFromGrpah, humidityFromGraph, "poly2")
[f3, fo] = fit(tempFromGrpah, humidityFromGraph, "poly3")
formula(f2)
formula(f3)

scatter(tempFromGrpah,humidityFromGraph)
