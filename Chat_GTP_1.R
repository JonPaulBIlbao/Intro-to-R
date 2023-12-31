library(ggplot2)

# generate random normal data
x <- rnorm(1000, mean = 0, sd = 1)

# create a data frame with the random data
df <- data.frame(x)

# plot the data as a histogram with a normal curve overlay
ggplot(df, aes(x)) + 
  geom_histogram(binwidth = 0.5, fill = "darkblue", color = "white") + 
  geom_density(color = "red", size = 1.5) + 
  ggtitle("Normal Curve") + 
  xlab("X") + 
  ylab("Density")



# Create x values for curve
x <- seq(-4, 4, by = 0.01)

# Generate normal density values for x values
y <- dnorm(x)

# Plot normal curve
ggplot(data.frame(x), aes(x)) + 
  geom_line(aes(y = y), size = 1.5) + 
  labs(x = "X", y = "Density") + 
  ggtitle("Normal Distribution") + 
  theme_classic()

library(ggplot2)
x <- seq(-3, 3, length.out = 1000)
df <- data.frame(x = x)
df$y <- dnorm(x)

p <- ggplot(df, aes(x = x, y = y)) +
  geom_line(color = "blue") +
  geom_area(data = subset(df, x < -1.96), aes(x = x, y = y), fill = "blue", alpha = 0.2) +
  xlim(-3, 3) +
  ylim(0, 0.5)
p

library(ggplot2)

mu <- 0
sigma <- 1
x <- seq(-4, 4, by = 0.01)
y <- dnorm(x, mean = mu, sd = sigma)
df <- data.frame(x, y)

p <- ggplot(df, aes(x, y)) +
  geom_line(color = "black", size = 1) +
  geom_ribbon(aes(ymin = 0, ymax = y), xmin = -1.96, xmax = 1.96, fill = "blue", alpha = 0.5) +
  geom_ribbon(aes(ymin = 0, ymax = y), xmin = -Inf, xmax = -1.96, fill = "blue", alpha = 0.5) +
  geom_ribbon(aes(ymin = 0, ymax = y), xmin = 1.96, xmax = Inf, fill = "blue", alpha = 0.5) +
  labs(x = "", y = "Density") +
  theme_classic()

p

library(ggplot2)

x <- seq(-5, 5, by = 0.01)

y <- dnorm(x)

df <- data.frame(x, y)

ggplot(df, aes(x, y)) +
  geom_line(size = 1.2) +
  geom_area(aes(x = x, y = ifelse(x > 1.96, y, 0)), fill = "blue", alpha = 0.5) +
  geom_area(aes(x = x, y = ifelse(x < -1.96, y, 0)), fill = "blue", alpha = 0.5) +
  scale_x_continuous(limits = c(-5, 5), expand = c(0, 0)) +
  scale_y_continuous(limits = c(0, 0.5), expand = c(0, 0)) +
  labs(x = "Z", y = "Density") +
  theme_classic()

library(ggplot2)

x <- seq(-6, 6, length.out = 300)
y <- 1 / (1 + exp(-x))
df <- data.frame(x, y)

ggplot(df, aes(x, y)) +
  geom_line() +
  ggtitle("Logistic Function") +
  xlab("x") +
  ylab("y = 1 / (1 + exp(-x))")

x <- seq(-10, 10, by = 0.1)
y <- 1 / (1 + exp(-x))

ggplot(data.frame(x, y), aes(x, y)) +
  geom_line() +
  xlab("X") +
  ylab("P(Y = 1)") +
  scale_x_continuous(breaks = seq(-10, 10, by = 1)) +
  ggtitle("Logistic Function")

library(ggplot2)
x <- seq(-10, 10, by = 0.1)
y <- 1 / (1 + exp(-x))

ggplot(data.frame(x=x, y=y), aes(x=x, y=y)) + 
  geom_line(color="blue") + 
  scale_x_continuous(limits=c(-10, 10), expand=c(0,0), breaks=seq(-10, 10, by = 1)) + 
  scale_y_continuous(limits=c(0, 1), expand=c(0,0), breaks=seq(0, 1, by = 0.1)) +
  xlab("x") + ylab("y") + 
  ggtitle("Logistic Function")

A <- matrix(c(1,0.98,0.3,0.98,1,0.6,0.3,0.6,1), ncol=3)
eigen(A)




