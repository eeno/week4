#load managers dataset
more_data <- read.csv("MoreData(1).csv", header = TRUE)

new_managers_data <- data.frame(more_data)
# show structure
str(new_managers_data)

include_list <- names(new_managers_data) %in% c("Date","Country","Gender", "Age","Q1","Q2","Q3","Q4","Q5")

new_managers_data <- new_managers_data[include_list]

new_managers_data$AgeCat[new_managers_data$Age >= 45 ] <- "Elder"
new_managers_data$AgeCat[new_managers_data$Age >= 26 & new_managers_data$Age <=44 ] <-"Middle aged"
new_managers_data$AgeCat[new_managers_data$Age >= 25 ] <- "Young"

AgeCat <- factor(new_managers_data$AgeCat,ordered = TRUE,levels = c( "Young", "Middle aged","Elder"))

new_managers_data$AgeCat <- AgeCat

summary_col <- new_managers_data$Q1 + new_managers_data$Q2 + new_managers_data$Q3 + new_managers_data$Q4 + new_managers_data$Q5

new_managers_data$Summary_col <- summary_col

new_managers_data


mean_value <- rowMeans(new_managers_data[5:9])




new_managers_data$Mean_Value <- mean_value


names(new_managers_data)[11] <- "Answer Total"
names(new_managers_data)[12] <- "Mean Value"

date_field <- as.character(new_managers_data$Date)
date_field
str(date_field)

new_date <- as.Date(date_field, "%Y-%d-%m")
new_managers_data$Date <- new_date
str(new_managers_data)


