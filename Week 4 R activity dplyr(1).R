#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
HairEyeColor

new_Hair <- HairEyeColor

new_Hair

new_hair <- as_tibble(new_Hair) 

new_hair

#See the top rows of the data
#TASK: Write the function to see the top rows of the data

library(package='dplyr')
new_hair  %>% slice_head(n = 1)
new_hair  %>% slice_head(n = 2)
new_hair  %>% slice_head(n = 3)
new_hair  %>% slice(1 : 5)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr

install.packages("dplyr")
library(package='dplyr')


#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)

new_hair %>% select(Hair, Sex)

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as a new dataset
#and give it a name

hair_sex<-new_hair %>% select(Hair, Sex)

hair_sex

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

hair_sex %>% select(Hair)

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'

new_hair %>% rename(Gender = Sex)

#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column

new_hair2 <- new_hair %>% rename(Gender = Sex)

new_hair2

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'

male<-new_hair2 %>% filter(Gender=='Male')

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)

new_hair2 %>% group_by(Gender)


#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#After you run it, write the total here:__592__

total=mutate(as_tibble(HairEyeColor), total=cumsum(n))


#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'

female<-new_hair2 %>% filter(Gender=='Female')

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

library(dplyr)
male_female=union (male, female)
male_female


#Optional Task: add any of the other functions 
#you learned about from the dplyr package

new_hair2 %>% relocate(Gender:Eye, .before = Hair)

new_hair2 %>% arrange(desc(n))

new_hair2 %>% arrange(n)