library(jsonlite)
library(tidyverse)
library(readr)
library(naniar)

setwd('C:/Users/Deanna/Documents/Job Stuff/Data Analyst/Raw Data')

brands <- stream_in(file("brands.json"))
receipts <- stream_in(file("receipts.json"))
users <- stream_in(file("users.json"))

brands$'_id' <- flatten(brands$'_id')
brands$cpg$`$id` <- flatten(brands$cpg$`$id`)

brands <- brands %>%
  as_tibble() %>%
  unnest(cpg)

brands$'_id' <- as.character(brands$'_id')
brands$`$id` <- as.character(brands$`$id`)

head(brands)

receipts$'_id' <- flatten(receipts$'_id')
receipts$'_id' <- as.character(receipts$'_id')

receipts <- receipts %>%
  as_tibble() %>%
  unnest(rewardsReceiptItemList,names_repair = "unique")

head(receipts)

users$'_id' <- flatten(users$'_id')
users$'_id' <- as.character(users$'_id')

users <- tibble(users)
head(users)

#why did dplyr not work? no idea. I didn't want to waste time making it work, so I went with base R

names(users)[1] <- "userId"
names(users)[2] <- "isActive"

names(brands)[1] <- "brandId"
names(brands)[5] <- "cpgId"
names(brands)[6] <- "cpgRef"

names(receipts)[1] <- "receiptId"
names(receipts)[9] <- "overallPointsEarned"
names(receipts)[14] <- "totalFinalPrice"
names(receipts)[38] <- "itemPointsEarned"

#good place to export the CSVs!

#write_csv(brands, "brands.csv", na = "NULL")
#write_csv(receipts, "receipts.csv", na="NULL")
#write_csv(users, "users.csv",na="NULL")

gg_miss_var(brands, show_pct = TRUE) + labs(title = "Missing Values in Brands Columns")
gg_miss_var(receipts, show_pct = TRUE) + labs(title = "Missing Values in Receipts Columns")
gg_miss_var(users, show_pct = TRUE) + labs(title = "Missing Values in Users Columns")

## I want to make a table that just has the three columns I want to inspect
recTemp <- receipts[,c(26,28,32)]
gg_miss_upset(recTemp)

