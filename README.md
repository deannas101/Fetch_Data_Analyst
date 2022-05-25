# Fetch Data Analyst Exercise

I'll put some more description stuff here! It'll be super pretty once everything else is all wrapped up :)

https://www.sqlshack.com/importing-and-working-with-csv-files-in-sql-server/

https://vertabelo.com/blog/vertabelo-tips-good-er-diagram-layout/

https://gitmind.com/er-diagram-tool.html

before making the ER diagram, I need to rename some of the column names to be more specific/human readable. Especially since receipts has 2 columns of the same name.

my_data %>% 
  rename(
    sepal_length = Sepal.Length,
    sepal_width = Sepal.Width
    )
    
^using dplyr

|Users|
|-----|
|_id|
|active|
|createdDate|
|lastLogin|
|role|
|signUpSource|
|state|

