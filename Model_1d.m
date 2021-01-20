%% 1D Model COVID-Simulation: Interacting cities with airplane travel 

 % ------PROGRESS------
 % One's are no longer turning negative
 % More organized
 % Added weighted impact parameters
 
 % ------LEFT TO FIX------
 % Add impact parameter to the calculation
 % 


% ------INITIAL PARAMETERS------

N = 5;                        % Number of people in a city
infection_rate = .7;          % Disease transmission rate
pandemic_duration = 5;       % Pandemic duration length (days)
deltaT = 0.2;                 % Time increment (days)

% ------IMPACT PARAMETERS------

masks = 1;                    % Masks worn = 0 , No masks = 1
social_distancing = 1;        % Social distancing = 0 , No social distancing = 1
sanitary_practices = 0;       % Handwashing = 0 , No handwashing = 1
gathering_environment = 0;    % Outdoors = 0 , Indoors = 1

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

% ------SETTING UP CITIES------

population_array = zeros(N,1);                          % Setting up the size of one city
disp('Population Size:');                               % Everyone in the city is not_infected = 0 
disp(population_array);

k = randsample(N,1);                                    % Grabbing a random individual from the city
disp('Patient Zero position in City A:')                % First random individual = 'patient zero'
disp(k)

status = population_array(k,1);                         % Checking the health status of patient zero
disp('Initial Health Status of Patient Zero:')          % At t = 0, patient zero is not_infected = 0
disp(status)

population_array(k,1) = 1;                              % Kickstarting the pandemic
disp('Unfortunate Health Status of Patient Zero:');     % Setting patient zero health status to infected = 1
disp(population_array(k,1))
disp('Population After Initial Infection:')
disp(population_array)

% ----Shit to do-----  
% 1. Wrap code below in loop to go through entire array  
% 2. Make two more loops for the other cities. 
% 3. Loop horizontally across the cities

for i = 1:pandemic_duration
        disp('Days:')
        disp(i)
    for j = 1:length(population_array)                  % Maybe Problem: This loops through the array in order of element 1 to element n
            disp('Node:')                               % we need to iterate from position of patient_zero and spread out that way
            disp(j)
        
        if k ~= length(population_array)               % check that patient zero is not the last element in the population array
            %contact_1 = population((k - 1),1);        % if it is, do not attempt to select that non-existent contact
            contact_1 = k - 1;                         % PROBLEM HERE: ONLY MOVES UP BY 1
            disp('Contact Above:')
            disp(contact_1)
        end
       
        infection_chanceA = rand();                    % calculate random chance that contact_1 becomes infected by patient_zero
        if infection_chanceA >= infection_rate
            disp('contcgdg')
            disp(population_array(k,1))                 
            population_array(k,1) = 1;                 % PROBLEM HERE: NOT REFERRING TO CONTACT_1 AT ALL
            disp('Here')
            disp(population_array(k,1))    
        end

        if k ~= 1                                      % check that patient zero is not the first element in the population array
            contact_2 = k + 1;                         % if it is, do not attempt to select that non-existent contact
            disp('Contact Below:')                     % PROBLEM HERE: ONLY MOVES DOWN BY 1
            disp(contact_2)
        end

        infection_chanceB = rand();                    % calculate random chance that contact_2 becomes infected by patient_zero
        if infection_chanceB >= infection_rate
            population_array((contact_2),1)=1;
            disp('There')
            disp(population_array((contact_2),1))   
        end

        disp('Final state of population')
        disp(population_array)
        disp('Run')
        disp(i)

        
    end 
end


total_infected = sum(population_array(:) == 1);
       disp('Total Infected:')
       disp(total_infected)
       disp('Array Length')
       disp(size(population_array))


 
 
 
 
 
 
