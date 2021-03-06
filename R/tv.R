#' Score the TV watching model
#' 
#' Simple model with two predictor \code{age} (value between 20 and 80) and \code{marital} 
#' ("MARRIED", 'DIVORCED", "WIDOWED or "NEVER MARRIED").
#' 
#' @export
#' @importFrom mgcv predict.gam
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(
#'    age=c(24, 54, 32, 75),
#'    marital=c("MARRIED", "DIVORCED", "WIDOWED", "NEVER MARRIED")
#' )
#' tv(mydata)
tv <- function(input){
  #input can either be csv file or data	
  newdata <- if(is.character(input) && file.exists(input)){
    read.csv(input)
  } else {
    as.data.frame(input)
  }
  n <- sum(c("age", "sex", "race","marital")%in%names(newdata))
  if(n!=4) stop("all variables in test data nust match model")
  newdata$age <- as.numeric(newdata$age)
  #tv_model is included with the package
  newdata$tv <- as.vector(predict(tv_model, newdata = newdata))
  return(newdata)
}
