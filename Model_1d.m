%% 1d model: interacting cities with airplane travel 

% get person 1s coordinates
% is person1 infected?
% { 
% if person1 is infected, and they are adjacent to someone who is not 
% { 
%   calculate percent change that they will infect person2
% 

% Constants
N = 10;
infection_rate = .7;

population = zeros(N,1);
disp('Population Size:');
disp(population);

patient_zero_coord_y = randsample(N,1);
disp('Patient Zero Coordinates:')
disp(patient_zero_coord_y)

status = population(patient_zero_coord_y,1);
disp('Health Status of Patient Zero')
disp(status)

population(patient_zero_coord_y,1) = 1;
disp('Unfortunate Health Status of Patient Zero:');
disp(population(patient_zero_coord_y,1))

disp(population)

% check that patient zero is not the last element in the population array
% if it is, do not attempt to select that non-existent contact
if patient_zero_coord_y ~= length(population)
	%contact_1 = population((patient_zero_coord_y - 1),1);
    contact_1 = patient_zero_coord_y - 1;
    disp('Contact 1:')
    disp(contact_1)
end

% calculate random chance that contact_1 becomes infected by patient_zero
infection_chance = rand();
if infection_chance >= infection_rate
    population((contact_1),1)=1;
    disp('Here')
    disp(population((contact_1),1))    
end

% check that patient zero is not the first element in the population array
% if it is, do not attempt to select that non-existent contact
if patient_zero_coord_y ~= 1
    contact_2 = patient_zero_coord_y + 1; 
    disp('Contact 2:')
    disp(contact_2)
end

% calculate random chance that contact_2 becomes infected by patient_zero
infection_chance = rand();
if infection_chance >= infection_rate
    population((contact_2),1)=1;
    disp('There')
    disp(population((contact_2),1))   
end

disp('Final state of population')
disp(population)








