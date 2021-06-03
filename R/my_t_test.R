#' T test
#'
#' This function performs a t-test
#'
#' @param x a numeric vector of data
#' @param alternative a character string specifying the alternative hypothesis. Only accepts "two.sided", "less", or "greater".
#' @param mu a number indicating the null hypothesis value of the mean.
#' @keywords t test
#'
#' @return A list with the numeric test statistic, the degrees of freedom, the value of the parameter "alternative", and the p value
#'
#' @examples
#' my_t_test(rnorm(36), "two.sided", 0)
#' my_t_test(rpois(40,lambda=8), "less", 7)
#'
#' @export
my_t_test <- function(x, alternative, mu){

  if (alternative == "two.sided"|alternative == "less"|alternative == "greater"){
    valid <- TRUE
  }else{
    valid <- FALSE
  }

  if (valid==FALSE) {
    stop("invalid value for alternative")
    }

  #degrees of freedom is one less than sample size
  df <- length(x)-1

  #test statistic
  test_stat <- ((mean(x) - mu) / ((sd(x)/sqrt(length(x)))))

  #p-value depends on alternative
  if(alternative == "less"){
    p_val <- pt(test_stat, df = length(x)-1)
  }
  else if(alternative == "greater"){
    p_val <- 1 - pt(test_stat, df = length(x)-1)
  }
  else if(alternative == "two.sided"){
    p_val <- 2*pt(q = -abs(test_stat), df = length(x)-1)
  }

  return(list("test statistic" = test_stat, "degrees of freedom" = df,
              "alternative" =  alternative,"p value" = p_val))
}
