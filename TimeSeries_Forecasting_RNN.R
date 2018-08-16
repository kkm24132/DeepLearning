# -----------------------------------------------------------------------------------------
# Time Series Forecasting with RNN
# Temperature-forecasting problem, where you have access to a time series of data points coming from sensors 
# installed on the roof of a building, such as temperature, air pressure, and humidity, 
# which is used to predict what the temperature will be 24 hours after the last data point.

# Dataset: 14 parameters - are recorded every 10 mins
# air temperature, atmospheric pressure, humidity, wind direction etc

# loopback = 1440 - observation will go back 10 days
# steps = 6 - observations will be sampled at one data point per hour
# delay = 144 - targets will be 24 hrs in the future

# Load required libraries
library(tibble)
library(readr)
library(ggplot2)


# -----------------------------------------------------------------------------------------
# 1: Get the data
# weather timeseries dataset recorded at the Weather Station at the Max Planck Institute for Biogeochemistry in Jena, Germany

dir.create("~/Downloads/jena_climate", recursive = TRUE)

download.file(
  "https://s3.amazonaws.com/keras-datasets/jena_climate_2009_2016.csv.zip",
  "~/Downloads/jena_climate/jena_climate_2009_2016.csv.zip"
)
unzip(
  "~/Downloads/jena_climate/jena_climate_2009_2016.csv.zip",
  exdir = "~/Downloads/jena_climate"
)


# -----------------------------------------------------------------------------------------
# 2: Analyze the dataset

data_dir <- "~/Downloads/jena_climate"
fname <- file.path(data_dir, "jena_climate_2009_2016.csv")
data <- read_csv(fname)

glimpse(data)

# Here is the plot of temperature (in degrees Celsius) over time. 
# On this plot, you can clearly see the yearly periodicity of temperature
ggplot(data, aes(x = 1:nrow(data), y = `T (degC)`)) + geom_line()

# Here is a more narrow plot of the first 10 days of temperature data  
# Because the data is recorded every 10 minutes, you get 144 data points per day.
ggplot(data[1:1440,], aes(x = 1:1440, y = `T (degC)`)) + geom_line()


# -----------------------------------------------------------------------------------------
# 3: Prepare / Preprocess the dataset

# First, you’ll convert the R data frame which we read earlier into a matrix of floating point values
# (we’ll discard the first column which included a text timestamp)

data <- data.matrix(data[,-1])

# You’ll then preprocess the data by subtracting the mean of each time series and dividing by the standard deviation. 
# You’re going to use the first 200,000 timesteps as training data, so compute the mean and standard deviation 
# for normalization only on this fraction of the data.
train_data <- data[1:200000,]
mean <- apply(train_data, 2, mean)
std <- apply(train_data, 2, sd)
data <- scale(data, center = mean, scale = std)

# The code for the data generator you’ll use is below. It yields a list (samples, targets), where samples 
# is one batch of input data and targets is the corresponding array of target temperatures. It takes 
# the following arguments:
# data — The original array of floating-point data, which you normalized in listing 6.32.
# lookback — How many timesteps back the input data should go.
# delay — How many timesteps in the future the target should be.
# min_index and max_index — Indices in the data array that delimit which timesteps to draw from. This is useful for keeping a segment of the data for validation and another for testing.
# shuffle — Whether to shuffle the samples or draw them in chronological order.
# batch_size — The number of samples per batch.
# step — The period, in timesteps, at which you sample data. You’ll set it 6 in order to draw one data point every hour.

generator <- function(data, lookback, delay, min_index, max_index,
                      shuffle = FALSE, batch_size = 128, step = 6) {
  if (is.null(max_index))
    max_index <- nrow(data) - delay - 1
  i <- min_index + lookback
  function() {
    if (shuffle) {
      rows <- sample(c((min_index+lookback):max_index), size = batch_size)
    } else {
      if (i + batch_size >= max_index)
        i <<- min_index + lookback
      rows <- c(i:min(i+batch_size-1, max_index))
      i <<- i + length(rows)
    }
    
    samples <- array(0, dim = c(length(rows), 
                                lookback / step,
                                dim(data)[[-1]]))
    targets <- array(0, dim = c(length(rows)))
    
    for (j in 1:length(rows)) {
      indices <- seq(rows[[j]] - lookback, rows[[j]]-1, 
                     length.out = dim(samples)[[2]])
      samples[j,,] <- data[indices,]
      targets[[j]] <- data[rows[[j]] + delay,2]
    }            
    
    list(samples, targets)
  }
}

# The i variable contains the state that tracks next window of data to return, so it is updated using 
# superassignment (e.g. i <<- i + length(rows)).
# Now, let’s use the abstract generator function to instantiate three generators: one for training, 
# one for validation, and one for testing. Each will look at different temporal segments of the 
# original data: the training generator looks at the first 200,000 timesteps, the validation generator 
# looks at the following 100,000, and the test generator looks at the remainder

lookback <- 1440
step <- 6
delay <- 144
batch_size <- 128

train_gen <- generator(
  data,
  lookback = lookback,
  delay = delay,
  min_index = 1,
  max_index = 200000,
  shuffle = TRUE,
  step = step, 
  batch_size = batch_size
)

val_gen = generator(
  data,
  lookback = lookback,
  delay = delay,
  min_index = 200001,
  max_index = 300000,
  step = step,
  batch_size = batch_size
)

test_gen <- generator(
  data,
  lookback = lookback,
  delay = delay,
  min_index = 300001,
  max_index = NULL,
  step = step,
  batch_size = batch_size
)

# How many steps to draw from val_gen in order to see the entire validation set
val_steps <- (300000 - 200001 - lookback) / batch_size

# How many steps to draw from test_gen in order to see the entire test set
test_steps <- (nrow(data) - 300001 - lookback) / batch_size

mean(abs(preds - targets))

# Evaluation Loop
library(keras)
evaluate_naive_method <- function() {
  batch_maes <- c()
  for (step in 1:val_steps) {
    c(samples, targets) %<-% val_gen()
    preds <- samples[,dim(samples)[[2]],2]
    mae <- mean(abs(preds - targets))
    batch_maes <- c(batch_maes, mae)
  }
  print(mean(batch_maes))
}

evaluate_naive_method() #0.2789863
# This yields an MAE of 0.29. Because the temperature data has been normalized to be centered on 0 
# and have a standard deviation of 1, this number isn’t immediately interpretable. It translates to 
# an average absolute error of 0.29 x temperature_std degrees Celsius: 2.57 degree C.

celsius_mae <- 0.29 * std[[2]]


