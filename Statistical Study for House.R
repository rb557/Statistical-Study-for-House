#The problem is to discover relation between US new house construction starts data (HOUST) and macro economic indicators: GDP, CPI and Population (POP).

#Build the model for HOUST ~ GDP + CPI + quarter
#To build this model we have to first prepare the data by combining all the data into a R dataframe obejct
#We will have to also construct a dummy pr factor variable for 4 quarters
library(xlsx)
# We use library xlsx so that we can read xls file and don't have to convert them into csv manually
setwd("/Users/richa/Desktop/Intro to Statistics/final/House")
getwd()
#read the cpi data
cpi <- read.xlsx("cpi.xls",sheetName="CPI",header = TRUE)
summary(cpi)
gdp <- read.xlsx("gdp.xls",sheetName = "GDP", header = TRUE)
summary(gdp)
houst <- read.xlsx("houst.xls", sheetName = "HOUST", header = TRUE)
summary(houst)
pop <- read.xlsx("pop.xls",sheetName = "POP", header = TRUE)
summary(pop)
# Now we will merge each one of them to get the model based on the date
h = merge(houst,pop,by = "DATE",all = T)
h2 = merge(h,gdp, by = "DATE", all = T)
house = merge(h2,cpi,by ="DATE", all = T)
summary(house)
house$gdp <- house$VALUE.x
house$cpi <- house$VALUE.y
summary(house)
#Now we see that the data needs cleaning because it has NA values
house=na.omit(house)
summary(house)
house$quarter <- quarters(house$DATE)
summary(house)
#Building a model for HOUST ~ gdp + cpi + quarter
model <- lm(HOUST ~ gdp + cpi + quarter, data=house)
summary(model)
model
#To observe the seasonal effect we can take use of ANOVA function.
anova(model)
#we can either write anova(model) or summary.aov(model). Both give the same output.
#In order to get a design matrix we use model.matrix(model) to get the matrix.
model.matrix(model)
summary(model.matrix(model))
model
#We observe that there is a difference in the quarters and hence we conclude that there is seasonal effect.
#Here I also did a pair-wise comparison to study the different quarters.
#Using this study we can see the best house to buy
fit <- lm(HOUST ~ gdp + cpi + quarter, data = house)
#To check on the difference between the means of the levels with the specified family-wise probability we can use the TukeyHSD function.
tci <- TukeyHSD(aov(fit),conf.level = 0.90)
summary(tci)
plot(tci)
#Now I build another model by adding the Population.
new_model <- lm(HOUST ~ gdp + cpi + quarter + POP,data=house)
summary(new_model)
round(coef(new_model),1)
model.matrix(new_model)
summary(model.matrix(new_model))
#Quarter1 is the reference level with mean 299, Quarter2=109.6, Quarter3=91.9, Quarter4=29.0 larger on average. We have also designed the matrix using model.matrix() function.
#The three test statistics for the group levels correspond to comparisons with the refernce Quarter1. We see there is seasonal effect as there is a difference in the quarters.
anova(new_model)
#Here I do the same steps for the the new_model to do the pai-wise comparisons for different quarters.
new_tci <- TukeyHSD(aov(new_model),conf.level = 0.90)
new_tci
plot(new_tci)
#We see here that since the p-value of population is very large, so there is no difference in the seasonal effect by adding population.