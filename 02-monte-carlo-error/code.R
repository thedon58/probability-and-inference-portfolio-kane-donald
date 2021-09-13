## rbinom(n,size,probability)

## Example

p <- 0.4
n <- 100
r <- 10000
p_hat <- sum(rbinom(10,100,.6))/1000
mean(abs(p_hat - p)) # absolute error
mean(abs(p_hat-p)/p) # relative error

# Create data frame

output <- expand.grid(
  N = 2^c(2:15),
  P = c(0.01, 0.05, 0.10, 0.25, 0.50),
  abs_error = NA,
  rel_error = NA,
  KEEP.OUT.ATTRS = FALSE
)

# For loop to run simulations
r <- 10000
for(i in 1:nrow(output)) {
  p <- output$P[i]
  n <- output$N[i]
  p_hat <- rbinom(r,n,p)/n
  output[i, "abs_error"] <- mean(abs(p_hat - p)) 
  output[i, "rel_error"] <- mean(abs(p_hat-p)/p) 
}
head(output)  


output %>%
  mutate(x = log2(N)) %>%
  mutate(abs_error = log10(rel_error)) %>%
  mutate(col = as.factor(P) %>% as.numeric) %>%
  plot_setup(abs_error ~ x, c(0,15)) %>%
  split(.$P) %>%
  lwith({
    lines(x, abs_error, col = col[1], lwd = 5, type = "b", pch = 16)
    text(x[1], abs_error[1], "p="%|%P[1], pos = 2, col=col[1])
  })
axis(2, at = axTicks(2))
axis(1, at = axTicks(1), labels = 2^axTicks(1))
box()

ggplot(output, aes(x=N, y=abs_error)) + geom_line(aes(col=P)) + scale_x_continuous(trans='log2')

install.packages("remotes")
library("remotes")
remotes::install_github("thomasgstewart/tgsify")



