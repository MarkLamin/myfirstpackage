#' Random Forest
#'
#' This function uses Random Forest as a method of statistical prediction and records the error
#'
#' @param k an integer representing the number of folds
#' @keywords prediction
#'
#' @return Numeric with the cross validation error
#'
#' @examples
#' my_rf_cv(5)
#'
#' @export
my_rf_cv <- function(k){
  penguins <- myfirstpackage::my_penguins
  penguins <- penguins %>% na.omit
  fold <- NA
  #create folds
  a_fold <- sample(rep(1:k, length = nrow(penguins)))
  penguins <- penguins %>% dplyr::mutate(fold = a_fold)

  #initialize predictions
  pred <- rep(NA, length(nrow(penguins)))

  #iterate through each fold
  for(i in(1:k)){

    #split data into training and testing
    data_train <- penguins %>% dplyr::filter(fold != i)
    data_test <- penguins %>% dplyr::filter(fold == i)

    #using random forest
    model <- randomForest::randomForest(body_mass_g ~ bill_length_mm + bill_depth_mm +
                            flipper_length_mm,
                          data = data_train, ntree = 100)
    pred[a_fold == i] <- predict(model, newdata = data_test[, -6])
  }

  #Calculate MSE
  MSE <- mean((pred - penguins$body_mass_g)^2)

  #Calculate CV error
  cv_err <- MSE/k
  return(cv_err)
}
