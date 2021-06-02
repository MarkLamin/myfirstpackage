#' K nearest neighbors
#'
#' Uses k nearest neighbors as a method of statistical prediction and records the error
#'
#' @param train input dataframe
#' @param cl true class value of your training data
#' @param k_nn integer value representing the number of neighbors
#' @param k_cv integer value representing the number of folds
#'
#' @keywords k nearest neighbors
#'
#' @return A list with the predicted class values and the cross validation misclassification error
#'
#' @examples
#' my_penguins <- my_penguins %>% na.omit
#' my_knn_cv(my_penguins[3:6], my_penguins$species, 1, 5)
#'
#' @export
my_knn_cv <- function(train, cl, k_nn, k_cv){

  #create folds
  fold <- sample(rep(1:k_cv, length = length(rownames(train))))

  #set folds to dataset
  data <- train %>% dplyr::mutate(fold = fold)

  #initialize predictions
  pred <- rep(NA, length(cl))

  #iterate through different folds as test data
  for(i in (1:k_cv)){

    #split data into training and testing
    data_train <- data %>% dplyr::filter(fold != i)
    data_test <- data %>% dplyr::filter(fold == i)

    #account for length in the class
    cl_train <- cl[fold != i]
    cl_test <- cl[fold == i]

    #store prediction
    pred[fold == i] <- as.character(class::knn(data_train[,-ncol(data_train)],
                                        data_test[,-ncol(data_test)],
                                        cl_train, k_nn))
  }
  class <- as.character(class::knn(train,train,cl,k_nn))
  cv_err <- mean(pred != cl)
  return(list(class, cv_err))

}
