# Some data viz and descriptive stats for G2F data 
# Author: Sebastiano Busato 
# Date 11292022

#libraries 
library(dplyr)
library(ggplot2)
library(tidyr)
library(lubridate)
library(cluster)
library(ClusterR)
library(factoextra)
library(NbClust)
library(dtwclust)
library(DataExplorer)

setwd("A:/Drive_sync/Work_NCSU/Projects/G2F")

#read DFs
Train1_Trait_df <- read.csv("Training_Data/1_Training_Trait_Data_2014_2021.csv", header = T)
Train2_Meta_df <- read.csv("Training_Data/2_Training_Meta_Data_2014_2021.csv", header = T)
Train3_Soil_df <- read.csv("Training_Data/3_Training_Soil_Data_2015_2021.csv", header = T)
Train4_NASA_df <- read.csv("Training_Data/4_Training_Weather_Data_2014_2021.csv", header = T)
Train6_Covar_df <- read.csv("Training_Data/6_Training_EC_Data_2014_2021.csv", header = T)

Test1_Submission_df <- read.csv("Testing_Data/1_Submission_Template_2022.csv", header = T)
Test2_Meta_df <- read.csv("Testing_Data/2_Testing_Meta_Data_2022.csv", header = T)
Test3_Soil_df <- read.csv("Testing_Data/3_Testing_Soil_Data_2022.csv", header = T)
Test4_NASA_df <- read.csv("Testing_Data/4_Testing_Weather_Data_2022.csv", header = T)
#visualize NASA data per Env -- ongoing

Train4_NASA_df$Date_tidy <- ymd(Train4_NASA_df$Date)
Test4_NASA_df$Date_tidy <- ymd(Test4_NASA_df$Date)

glimpse(Train4_NASA_df)
summary(Train4_NASA_df)
unique(Train4_NASA_df$Env)


create_report(Train4_NASA_df)

#what enviro 2022 has no data? 
Env2022_Sub <- unique(Test1_Submission_df$Env)
Env2022_Data <- unique(Test4_NASA_df$Env)
Env201421 <- unique(Train1_Trait_df$Env)


ggplot() + geom_smooth(data = Test4_NASA_df, aes(x = Date_tidy, y = T2M, color = Env), show.legend = FALSE) 

#Time series clustering of NASA data -- ongoing

KMdf_4 <- Train4_NASA_df[, -1]

#correlation matrix of NASA and EC data -- ongoing 
year(Train4_NASA_df$Date_tidy)
Train_Merge46_byEnv <- merge(Train6_Covar_df, Train4_NASA_df, by="Env")


Train1_Trait_df[Train1_Trait_df$Yield_Mg_ha=="NA",]
