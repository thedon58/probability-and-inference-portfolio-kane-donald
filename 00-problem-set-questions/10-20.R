# (a) Generate, via simulation, a plot of the distribution of the 
# 25th percentile of a sample of size 100 when the underlying 
# distribution is gamma with shape = 3 and scale = 12 
# (b) Overlay on the plot from (a) the analytic solution of the pdf

library(tidyverse)
q_bmi <- array(NA, 500)
v <- array(NA, 5000)
for (i in seq_along(q_bmi)){
  t <- rgamma(100, shape = 3, scale = 12)
  v[i] <- quantile(t, .25)
}
hist(v, breaks = 100, freq = FALSE, main = "")
curve(dgamma(x, 3, scale=12), lwd = 3, add = TRUE, col = "blue")