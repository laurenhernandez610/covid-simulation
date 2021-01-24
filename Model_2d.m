%% 2D Model COVID-Simulation: Interacting cities with airplane travel 
clc;
clear all;

% ------INITIAL PARAMETERS------

N = 5;                                           % Number of people in a city
infection_rate = .7;                             % Disease transmission rate
pandemic_duration = 5;                           % Pandemic duration length (days)
deltaT = 0.2;                                    % Time increment (days)
step_size = (pandemic_duration/deltaT);          % Step size for each iteration     

% ------IMPACT PARAMETERS------

impact_parameters = 0;                           % Including/excluding impact parameters 
masks = 0;                                       % Masks worn = 0 , No masks = 1
social_distancing = 0;                           % Social distancing = 0 , No social distancing = 1
sanitary_practices = 0;                          % Handwashing = 0 , No handwashing = 1
gathering_environment = 0;                       % Outdoors = 0 , Indoors = 1


if impact_parameters == 1
    
    if masks == 0
        mask = 0;
    else
        mask = 0.20;
    end

    if social_distancing == 0
        social_distancing = 0;
    else
        social_distancing = 0.30;
    end

    if sanitary_practices == 0
        sanitary_practices = 0;
    else
        sanitary_practices = 0.1;
    end

    if gathering_environment == 0
        gathering_environment = 0;
    else
        gathering_environment = 0.40;
    end 
    
    spread_ratio = (mask + social_distancing + sanitary_practices + gathering_environment);
    disp('Probability that COVID-19 will be contracted:')
    disp(spread_ratio)
end


% ------SETTING UP CITIES------
% Probably should turn this into a loop for the 3 cities

population_arrays = zeros(N,3);                         % Setting up the size of one city
disp('Population Size:');                               % Everyone in the city is not_infected = 0 
disp(population_arrays);

= randsample(N,1);                                    % Grabbing a random individual from the city
disp('Patient Zero position in City A:')                % First random individual = 'patient zero'; ALSO too many k's wtf
disp(k)

status = population_arrays(k,1);                        % Checking the health status of patient zero
disp('Initial Health Status of Patient Zero:')          % At t = 0, patient zero is not_infected = 0
disp(status)

population_arrays(k,1) = 1;                             % Kickstarting the pandemic
disp('Unfortunate Health Status of Patient Zero:');     % Setting patient zero health status to infected = 1
disp(population_arrays(k,1))
disp('Population After Initial Infection:')
disp(population_arrays)