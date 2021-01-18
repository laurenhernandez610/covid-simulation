%% 1d model: interacting cities with airplane travel 

% get person 1s coordinates
% is person1 infected?
% { 
% if person1 is infected, and they are adjacent to someone who is not 
% { 
%   calculate percent change that they will infect person2
% 

% Parameters 
N = 10;
infection_rate = .7;
pandemic_duration = 20;


population_arr = zeros(N,1);
disp('Population Size:');
disp(population_arr);

k = randsample(N,1);
disp('Patient Zero Coordinates:')
disp(k)

status = population_arr(k,1);
disp('Health Status of Patient Zero')
disp(status)

population_arr(k,1) = 1;
disp('Unfortunate Health Status of Patient Zero:');
disp(population_arr(k,1))
disp('pop arr')
disp(population_arr)

% todo: wrap code below in loop to go through entire array

for i = 1:pandemic_duration
        disp('i:')
        disp(i)
    for j = 1:length(population_arr)
            disp('j:')
            disp(j)
        % check that patient zero is not the last element in the population array
        % if it is, do not attempt to select that non-existent contact
        if k ~= length(population_arr)
            %contact_1 = population((k - 1),1);
            contact_1 = population_arr - 1;
            disp('Contact Above:')
            disp(contact_1)
        end

        % calculate random chance that contact_1 becomes infected by patient_zero
        infection_chanceA = rand();
        if infection_chanceA >= infection_rate
            disp('contcgdg')
            disp(population_arr(k,1))
            population_arr(k,1) = 1;
            disp('Here')
            disp(population_arr(k,1))    
        end

        % check that patient zero is not the first element in the population array
        % if it is, do not attempt to select that non-existent contact
        if k ~= 1
            contact_2 = k + 1; 
            disp('Contact Below:')
            disp(contact_2)
        end

        % calculate random chance that contact_2 becomes infected by patient_zero
        infection_chanceB = rand();
        if infection_chanceB >= infection_rate
            population_arr((contact_2),1)=1;
            disp('There')
            disp(population_arr((contact_2),1))   
        end

        disp('Final state of population')
        disp(population_arr)
        disp('Run')
        disp(i)

        
    end 
end


total_infected = sum(population_arr(:) == 1);
       disp('Total Infected:')
       disp(total_infected)
       disp('Array Length')
       disp(size(population_arr))


