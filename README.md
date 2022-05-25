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

|**Users**|New Column Name|
|-----|
|_id|userId|
|active|isActive|
|createdDate||
|lastLogin||
|role||
|signUpSource||
|state||

|**Brands**|New Column Name|
|---|---|
|_id|brandId|
|barcode||
|category||
|categoryCode||
|cpg.$id|cpgId|
|cpg.$ref|cpgRef|
|name||
|topBrand||
|brandCode||

|**Receipts**|New Column Name|
|---|---|
|_id|receiptId|
|bonusPointsEarned||
|bonusPointsEarnedReason||
|createDate||
|dateScanned||
|finishedDate||
|modifyDate||
|pointsAwardedDate||
|pointsEarned...9|overallPointsEarned|
|purchaseDate||
|purchasedItemCount||
|barcode|| <- does this barcode match the brand barcode?
|description||
|finalPrice|totalFinalPrice|
|itemPrice||
|needsFetchReview||
|partnerItemId||
|preventTargetGapPoints||
|quantityPurchased||
|userFlaggedBarcode||
|userFlaggedNewItem||
|userFlaggedPrice||
|userFlaggedQuantity||
|needsFetchReviewReason||
|pointsNotAwardedReason||
|pointsPayerId|| <- is this the brand id?
|rewardsGroup||
|rewardsProductPartnerId|| <- is this the brand id?
|userFlaggedDescription||
|originalMetaBriteBarcode||
|originalMetaBriteDescription||
|brandCode|| <- is this the foreign key to brand?
|competitorRewardsGroup||
|discountedItemPrice||
|originalReceiptItemText||
|itemNumber||
|originalMetaBriteQuantityPurchased||
|pointsEarned...38|itemPointsEarned|
|targetPrice||
|competitiveProduct||
|originalFinalPrice||
|originalMetaBriteItemPrice||
|deleted||
|priceAfterCoupon||
|metabriteCampaignId||
|rewardsReceiptStatus||
|totalSpent||
|userId|| <- foreign key to users
