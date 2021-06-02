my_knn_cv <- function(train, cl, k_nn, k_cv){

  #create folds
  fold <- sample(rep(1:k_cv, length = length(rownames(train))))

  #set folds to dataset
  data <- train %>% mutate(fold = fold)

  #initialize predictions
  pred <- rep(NA, length(cl))

  #iterate through different folds as test data
  for(i in (1:k_cv)){

    #split data into training and testing
    data_train <- data %>% filter(fold != i)
    data_test <- data %>% filter(fold == i)

    #account for length in the class
    cl_train <- cl[fold != i]
    cl_test <- cl[fold == i]

    #store prediction
    pred[fold == i] <- as.character(knn(data_train[,-ncol(data_train)],
                                        data_test[,-ncol(data_test)],
                                        cl_train, k_nn))
  }
  class <- as.character(knn(train,train,cl,k_nn))
  cv_err <- mean(pred != cl)
  return(list(class, cv_err))

}
