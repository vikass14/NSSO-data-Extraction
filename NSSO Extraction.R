library(readr)
install.packages("tidyverse")
library("tidyverse")
FHH_FV<-read_fwf(file="E:\\Personal Vikas\\NSSO\\FHH_FV.TXT",
                 fwf_cols(File_Identification = c(1,4), 
                Schedule =c(5,7),
                Quarter = c(8,9),
                Visit = c(10,11),
                Sector = c(12,12),
                State_Ut_Code = c(13,14), 
                District_Code = c(15,16), 
                NSS_Region = c(17,19), 
                Stratum = c(20,21), 
                Sub_Stratum = c(22,23), 
                Sub_Sample = c(24,24), 
                Fod_Sub_Region = c(25,28),  
                FSU = c(29,33),
                Sample_Sg_Sb_Number =c(34,34),
                Second_Stage_Stratum_Number = c(35,35),
                Sample_Household_Number = c(36,37), 
                Response_Code = c(40,40), 
                Survey_Code = c(41,41), 
                Household_Size = c(43,44),
                Household_Type = c(45,45), 
                Religion = c(46,46), 
                Social_Group = c(47,47), 
                HouseholdS_Usual_Consumer_Expenditure_In_A_Month = c(48,55),
                NSS = c(70,72), 
                NSC = c(73,75),
                MULT =c(76,85)),
                col_types = cols(File_Identification = col_character(),
                Schedule = col_integer(),
                Quarter = col_character(),
                Visit = col_character(),
                Sector = col_character(),
                State_Ut_Code = col_character(),
                District_Code = col_character(),
                NSS_Region = col_character(),
                Stratum = col_integer(),
                Sub_Sample = col_integer(),
                Sub_Stratum = col_integer(), 
                Fod_Sub_Region = col_integer(),
                Survey_Code = col_integer(),
                FSU = col_integer(),
                Sample_Sg_Sb_Number = col_integer(),
                Second_Stage_Stratum_Number = col_integer(),
                Sample_Household_Number= col_integer(),
                Response_Code=col_integer(), 
                Household_Size=col_integer(),
                Household_Type = col_integer(), 
                Religion=col_integer(),
                Social_Group=col_integer(),
                HouseholdS_Usual_Consumer_Expenditure_In_A_Month = col_character(),
                NSS = col_integer(),
                NSC = col_integer(),
                MULT = col_integer()))
View(FHH_FV)
FHH_RV<-read_fwf(file="E:\\Personal Vikas\\NSSO\\FHH_RV.TXT",
                 fwf_cols(File_Identification = c(1,4), 
                          Schedule =c(5,7),
                          Quarter = c(8,9),
                          Visit = c(10,11),
                          Sector = c(12,12),
                          State_Ut_Code = c(13,14), 
                          District_Code = c(15,16), 
                          NSS_Region = c(17,19), 
                          Stratum = c(20,21), 
                          Sub_Stratum = c(22,23), 
                          Sub_Sample = c(24,24), 
                          Fod_Sub_Region = c(25,28),  
                          FSU = c(29,33),
                          Sample_Sg_Sb_Number =c(34,34),
                          Second_Stage_Stratum_Number = c(35,35),
                          Sample_Household_Number = c(36,37), 
                          Response_Code = c(40,40), 
                          Survey_Code = c(41,41), 
                          Household_Size = c(43,44),
                          Household_Type = c(45,45), 
                          Religion = c(46,46), 
                          Social_Group = c(47,47), 
                          HouseholdS_Usual_Consumer_Expenditure_In_A_Month = c(48,55),
                          NSS = c(70,72), 
                          NSC = c(73,75),
                          MULT =c(76,85)),
                 col_types = cols(File_Identification = col_character(),
                                  Schedule = col_integer(),
                                  Quarter = col_character(),
                                  Visit = col_character(),
                                  Sector = col_character(),
                                  State_Ut_Code = col_character(),
                                  District_Code = col_character(),
                                  NSS_Region = col_character(),
                                  Stratum = col_integer(),
                                  Sub_Sample = col_integer(),
                                  Sub_Stratum = col_integer(), 
                                  Fod_Sub_Region = col_integer(),
                                  Survey_Code = col_integer(),
                                  FSU = col_integer(),
                                  Sample_Sg_Sb_Number = col_integer(),
                                  Second_Stage_Stratum_Number = col_integer(),
                                  Sample_Household_Number= col_integer(),
                                  Response_Code=col_integer(), 
                                  Household_Size=col_integer(),
                                  Household_Type = col_integer(), 
                                  Religion=col_integer(),
                                  Social_Group=col_integer(),
                                  HouseholdS_Usual_Consumer_Expenditure_In_A_Month = col_character(),
                                  NSS = col_integer(),
                                  NSC = col_integer(),
                                  MULT = col_integer()))
View(FHH_RV)
# Creating COmmon ID **
FHH_FV$Common_ID <- paste(FHH_FV$FSU,FHH_FV$Sample_Sg_Sb_Number, FHH_FV$Second_Stage_Stratum_Number, FHH_FV$Sample_Household_Number, sep = "")
View(FHH_FV)
FHH_RV$Common_ID <- paste(FHH_RV$FSU,FHH_RV$Sample_Sg_Sb_Number, FHH_RV$Second_Stage_Stratum_Number, FHH_RV$Sample_Household_Number, sep = "")
View(FHH_RV)
## Reorder column ID
FHH_FV <- FHH_FV[,c(27,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26)]
FHH_RV <- FHH_RV[,c(27,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26)]
## Merging House hold data 
FHH_FV_FHH_Rv_Common_ID <- intersect(names(FHH_FV), names(FHH_RV))
FHH_FV_FHH_RV <- merge(FHH_FV, FHH_RV, by = "Common_ID")
View(FHH_FV_FHH_RV)
##### Personal Level Data
FPER_FV<-read_fwf(file="E:\\Personal Vikas\\NSSO\\FHH_FV.TXT",
                  fwf_col()