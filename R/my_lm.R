my_lm <- function(formula, data){

  #create X matrix
  x_matrix <- model.matrix(formula, data)

  #create model frame in preparation for Y
  a_frame <- model.frame(formula, data)

  #create Y matrix
  y_matrix <- model.response(a_frame)

  #transpose of x
  x_transpose <- t(x_matrix)

  #calculation of beta hat
  beta_hat <- solve(x_transpose%*%x_matrix)%*%x_transpose%*%y_matrix

  #calculate degrees of freedom
  df <- nrow(x_matrix) - ncol(x_matrix)

  #estimate variance
  var_hat <- sum((y_matrix - x_matrix %*% beta_hat)^2/df)

  #standard error vector
  std_errors <- sqrt(diag(var_hat*solve(x_transpose%*%x_matrix)))

  #vector of test statistics
  t_stat <- beta_hat/std_errors

  #vector of p values
  p_vals <- 2*pt(-abs(t_stat), df)

  #create matrix
  results_mat <- cbind(beta_hat, std_errors, t_stat, p_vals)

  result_table <- as.table(results_mat)

  rownames(result_table) <- colnames(x_matrix)
  colnames(result_table) <- c("Estimate", "Std. Error", "t value", "P(>|t|)")

  return(result_table)

}
