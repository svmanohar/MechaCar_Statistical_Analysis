# import dplyr library
library(dplyr)

# import our csv
mecha_df <- read.csv('MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

# perform multiple linear regression, check effect of all six columns
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_df)

# Wrap in Summary() to obtain p-value and r-squared value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_df))

# import suspension data csv
suspension_df <- read.csv('Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

# create a total summary statistics dataframe
total_summary <- suspension_df %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = "keep") #create summary table with multiple columns

# create a summary statistics dataframe grouped by Manufacturing Lot
lot_summary <- suspension_df %>% group_by(Manufacturing_Lot, .add = F) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = "keep")

### Use student's t-test to analyze variance in means of lots
t.test(suspension_df$PSI,mu=1500)

### Use student's t-test to analyze variance in means of each lot against standard 1500 PSI
# subset the original dataset for each Lot
t.test(subset(suspension_df,Manufacturing_Lot=='Lot1')[3],mu=1500)

t.test(subset(suspension_df,Manufacturing_Lot=='Lot2')[3],mu=1500)

t.test(subset(suspension_df,Manufacturing_Lot=='Lot3')[3],mu=1500)