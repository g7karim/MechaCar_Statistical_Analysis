#####   Deliverable 1 #######
# Use the library() function to load the dplyr package.
library(dplyr)

# Import and read in the MechaCar_mpg.csv file as a dataframe.
mpg <- read.csv(file = '/Users/zilola/Desktop/R_Analysis/MechaCar_mpg.csv', stringsAsFactors = F)

# Perform linear regression using the lm() function. In the lm() function, pass in all six variables (i.e., columns), 
#and add the dataframe you created in Step 4 as the data parameter.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mpg)

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mpg))
# Save your MechaCarChallenge.RScript file to your GitHub repository

####### Deliverable 2 ########

# Import and read in the Suspension_Coil.csv file as a table.
sus_coils <- read.csv('/Users/zilola/Desktop/R_Analysis/Suspension_Coil.csv', stringsAsFactors = F)

# Write an RScript that creates a total_summary dataframe using the summarize() function
#to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary <- sus_coils %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI)) 
lot_summary <- sus_coils %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

####### Deliverable 3 #######
#using the t.test() function and its subset() argument to determine if 
#the PSI for each manufacturing lot is statistically different from the population
#mean of 1,500 pounds per square inch.
?t.test()
t.test(x=sus_coils$PSI, mu=1500) 
pop1 <- subset(sus_coils, Manufacturing_Lot=='Lot1') 
t.test(x=pop1$PSI, mu=1500) # t test on lot 1 cars' 
pop2 <- subset(sus_coils, Manufacturing_Lot=='Lot2') 
t.test(x=pop2$PSI, mu=1500) # t test on lot 2 cars' 
pop3 <- subset(sus_coils, Manufacturing_Lot=='Lot3')
t.test(x=pop3$PSI, mu=1500) 


