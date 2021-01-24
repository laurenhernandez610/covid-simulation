# 1D Model COVID-Simulation: Interacting cities with airplane travel 


 # ------PROGRESS------
 # 1's are no longer turning into -1
 # More organized/clear
 # Added weighted impact parameters
 # Fixed referencing to actually address contact above/contact below
 # If patient zero is at n=1, loop looks to length(n) & vice versa 
 
 # ------LEFT TO FIX------
 # Iterate from patient zero's position
 # Add each iteration to an output vector
 # Fix line 136
 
 # ------NOTES------ 
 # The loop runs through the array from positon 1 to position n only.
 # The loop only looks at patient zero, then repeatedly looks immediately 
 # above and immediately below.


# ------INITIAL PARAMETERS-----
N = 5                                           # Number of people in a city
infection_rate = .7                             # Disease transmission rate
pandemic_duration = 5                           # Pandemic duration length (days)
deltaT = 0.2                                    # Time increment (days)
step_size = (pandemic_duration/deltaT)          # Step size for each iteration     

# ------IMPACT PARAMETERS------

impact_parameters = 0                           # Including/excluding impact parameters 
masks = 1                                       # Masks worn = 0 , No masks = 1
social_distancing = 0                           # Social distancing = 0 , No social distancing = 1
sanitary_practices = 1                          # Handwashing = 0 , No handwashing = 1
gathering_environment = 0                       # Outdoors = 0 , Indoors = 1

if impact_parameters == 1:
    
    if masks == 0:
        mask = 0
    else:
        mask = 0.20
    end

    if social_distancing == 0:
        social_distancing = 0
    else:
        social_distancing = 0.30
    end

    if sanitary_practices == 0:
        sanitary_practices = 0
    else:
        sanitary_practices = 0.1
    end

    if gathering_environment == 0:
        gathering_environment = 0
    else:
        gathering_environment = 0.40
    end 
    
    spread_ratio = (mask + social_distancing + sanitary_practices + gathering_environment)
    print('Probability that COVID-19 will be contracted:')
    print(spread_ratio)
end


# ------SETTING UP CITIES------

population_array = numpuy.zeros([N,1], dtype = int)                         # Setting up the size of one city
print('Population Size:')                             # Everyone in the city is not_infected = 0 
print(population_array)

patient_zero = Carrier
# patient_zero_pos = random.sample(N,1)                                   % Grabbing a random individual from the city
patient_zero.location = patient_zero_pos
patient_zero.infected = 1
print('Patient Zero position in City A:')               # First random individual = 'patient zero'; ALSO too many k's wtf
print(patient_zero)


status = population_array(patient_zero,1)                        # Checking the health status of patient zero
print('Initial Health Status of Patient Zero:')          # At t = 0, patient zero is not_infected = 0
print(status)

population_array(patient_zero,1) = 1                             # Kickstarting the pandemic
print('Unfortunate Health Status of Patient Zero:');     # Setting patient zero health status to infected = 1
print(population_array(patient_zero,1))
print('Population After Initial Infection:')
print(population_array)

# ----Shit to do-----  
# 1. Wrap code below in loop to go through entire array  
# 2. Make two more loops for the other cities. 
# 3. Loop horizontally across the cities

output_matrix = numpuy.zeros([1,step_size], dtype = int) 

for i in step_size:
        print('Beginning Step Number:')
        print(i)
    for j in population_array:                                  
             print('Node being assesed:')                           # we need to iterate from position of patient_zero and spread out that way
             print(j)
        
            if patient_zero.location ~= 1:                           # check that patient zero is not the first element in the population array
                contact_1 = patient_zero - 1                         # PROBLEM HERE: ONLY MOVES UP BY 1, referencing the wrong way
                print('Location of Contact Above:')
                print(contact_1)
            else:
                contact_1 = length(population_array)                 # If patient zero is at top of the array, the loop goes to the bottom of the array TODO
            end

            infection_chanceA = rand()                               # calculate random chance that contact_1 becomes infected by patient_zero
            if infection_chanceA >= infection_rate  and contact_1 ~= 1:              
                population_array((contact_1),1) = 1      
                print('Contact Above After Infection:')
                print(population_array((contact_1),1))  
            else:
                print('{ Contact Above Not Infected }')
                print(blanks(1))
                print(blanks(1))
            end

            if patient_zero ~= length(population_array):               # check that patient zero is not the last element in the population array
                contact_2 = patient_zero + 1                           # if it is, do not attempt to select that non-existent contact
                print('Location of Contact Below:')                    #  PROBLEM HERE: ONLY MOVES DOWN BY 1; referencing the wrong way
                print(contact_2)
            else:
                contact_2 = population_array(1,1)                    # If patient zero is at the bottom of the array, the loop goes to the top of the array
            end

            infection_chanceB = rand()                               # calculate random chance that contact_2 becomes infected by patient_zero
            if infection_chanceB >= infection_rate and contact_2 ~= 1:
                population_array((contact_2),1) = 1                  #  error here --- sometimes unrecognizable 'Index in position 1 is invalid. Array indices must be positive integers or logical values.'
                print('Contact Below After Infection')
               print(population_array((contact_2),1))  
            else:
                 print('{ Contact Below Not Infected }')
                 print(blanks(1))
                 print(blanks(1))
            end   
    end
end 

 print('Final state of population')
            print(population_array)


total_infected = sum(population_array(:) == 1)
       print('Total Number Infected:')
       print(total_infected)
       print('Final size of the population:')
       print(size(population_array))



