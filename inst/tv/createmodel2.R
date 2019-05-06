#This script was used to create the model that is included with the package

#General Social Survey data
#For info see http://www3.norc.org/GSS+Website/Download/SPSS+Format/
#download.file("http://publicdata.norc.org/GSS/DOCUMENTS/OTHR/2012_spss.zip", destfile="2012_spss.zip")
#unzip("2012_spss.zip")
dat <- foreign::read.spss("GSS7216_R4.sav", to.data.frame=TRUE)

#GAM model
library(mgcv)
names(dat) <- tolower(names(dat))

dd <- na.omit(dat[c("age", "sex", "race", "marital", "tvhours")])
dd$age <- as.numeric(dd$age)
dd$tvhours <- as.numeric(dd$tvhours)

tv_model <- lm(tvhours ~ ., data = dd)

#Vizualize the model
plot(predict(tv_model)~age, col=marital, type ="o", data=dd) 
 
#Save the model
#dir.create("data", showWarnings=FALSE)
save(tv_model, file="C:/Users/m133937/Dropbox/Research/Deployment/computation/Obstetrics/Obstetrics/data/tv_model2.rda")


newdata <- data.frame(
  age=c(24, 54, 32, 75),
  sex = c("MALE", "MALE", "FEMALE", "FEMALE"), 
  race = c("WHITE", "BLACK", "WHITE", "WHITE"),
  marital=c("MARRIED", "DIVORCED", "WIDOWED", "NEVER MARRIED")
  )
   
tv <- predict(tv_model, newdata = newdata)



  