rclean <- refine
a <- rclean$company

#1.
rclean$company <- replace(rclean$company, agrep("phillips",a,ignore.case = TRUE, max=2) , "phillips")
rclean$company <- replace(rclean$company, agrep("akzo",a,ignore.case = TRUE, max=2) , "akzo")
rclean$company <- replace(rclean$company, agrep("van houten",a,ignore.case = TRUE, max=2) , "van houten")
rclean$company <- replace(rclean$company, agrep("unilever",a,ignore.case = TRUE, max=2) , "unilever")

#2.
rclean <- rclean %>% separate(Product.code...number,c("product_code","product_number"),sep="-")

#3
product_code = c("p","v","x","q")
product_category = c("Smartphone","TV","Laptop","Tablet")
add <- data.frame(product_code,product_category)
rclean <- left_join(rclean,add,by="product_code")

#4
rclean <- unite(rclean,"full_address",address, city, country, sep = ",")

#5
rclean$company_phillips <- ifelse(rclean$company == "phillips",1,0)
rclean$company_akzo <- ifelse(rclean$company == "akzo",1,0)
rclean$company_van_houten <- ifelse(rclean$company == "van houten",1,0)
rclean$company_unilever <- ifelse(rclean$company == "unilever",1,0)
rclean$product_smartphone <- ifelse(rclean$product_category == "Smartphone",1,0)
rclean$product_tv <- ifelse(rclean$product_category == "TV",1,0)
rclean$product_laptop <- ifelse(rclean$product_category == "Laptop",1,0)
rclean$product_tablet <- ifelse(rclean$product_category == "Tablet",1,0)





