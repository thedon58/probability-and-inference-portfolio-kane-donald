# (a) Generate, via simulation, a plot of the distribution of the 
# 25th percentile of a sample of size 100 when the underlying 
# distribution is gamma with shape = 3 and scale = 12 
# (b) Overlay on the plot from (a) the analytic solution of the pdf

require(tgsify)

q_bmi <- array(NA, 5000)
for(i in seq_along(q_bmi)) {
  q_bmi[i] <- rgamma(100, shape = 3, scale = 12) %>% quantile(0.25)
}
hist(q_bmi, freq = FALSE, breaks = 1000, add=TRUE, xlim = range(q_bmi))
plot(q_bmi)
