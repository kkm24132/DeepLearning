
# ------------------------------------------------------------------
# Getting started with Deep Learning using Keras and TensorFlow in R
# with MNIST dataset
# ------------------------------------------------------------------

# With launch of Keras in R, this fight is back at the center. Python was slowly becoming the de-facto 
# language for Deep Learning models. But with the release of Keras library in R with tensorflow (CPU and GPU 
# compatibility)  at the backend as of now, it is likely that R will again fight Python for the podium 
# even in the Deep Learning space.

# ------------------------------------------------------------------
# Step 1: Installation of Keras with tensorflow at the backend
install.packages("devtools")
install.packages("keras")
install.packages("tensorflow")
#devtools::install_github("rstudio/keras")

# The above step will load the keras library from the GitHub repository. Now it is time to 
# load keras into R and install tensorflow.
library(keras)
library(tensorflow)

# By default RStudio loads the CPU version of tensorflow. Use the below command to download 
# the CPU version of tensorflow.
install_tensorflow()

# To install the tensorflow version with GPU support for a single user/desktop system, use the below command.
install_tensorflow(gpu=TRUE)

# ------------------------------------------------------------------
# Different types models that can be built in R using Keras
# 1. Multi-Layer Perceptrons
# 2. Convoluted Neural Networks
# 3. Recurrent Neural Networks
# 4. Skip-Gram Models
# 5. Use pre-trained models like VGG16, RESNET etc.
# 6. Fine-tune the pre-trained models.


# ------------------------------------------------------------------
# Step 2: Classifying MNIST handwritten digits using an MLP in R
# Let us start with building a very simple MLP model using just a single hidden layer 
# to try and classify handwritten digits.

#loading keras library
library(keras)

#loading the keras inbuilt mnist dataset
data<-dataset_mnist()

#separating train and test file
train_x<-data$train$x
train_y<-data$train$y
test_x<-data$test$x
test_y<-data$test$y

rm(data)

# converting a 2D array into a 1D array for feeding into the MLP and normalising the matrix
train_x <- array(train_x, dim = c(dim(train_x)[1], prod(dim(train_x)[-1]))) / 255
test_x <- array(test_x, dim = c(dim(test_x)[1], prod(dim(test_x)[-1]))) / 255

#converting the target variable to once hot encoded vectors using keras inbuilt function
train_y<-to_categorical(train_y,10)
test_y<-to_categorical(test_y,10)

#defining a keras sequential model
model <- keras_model_sequential()

#defining the model with 1 input layer[784 neurons], 1 hidden layer[784 neurons] with dropout rate 0.4 
#and 1 output layer[10 neurons]
#i.e number of digits from 0 to 9
model %>% 
  layer_dense(units = 784, input_shape = 784) %>% 
  layer_dropout(rate=0.4)%>%
  layer_activation(activation = 'relu') %>% 
  layer_dense(units = 10) %>% 
  layer_activation(activation = 'softmax')

#compiling the defined model with metric = accuracy and optimiser as adam.
model %>% compile(
  loss = 'categorical_crossentropy',
  optimizer = 'adam',
  metrics = c('accuracy')
)

#fitting the model on the training dataset
history <- model %>% fit(train_x, train_y, 
                         epochs = 10, 
                         batch_size = 128,
                         validation_split = 0.2  # hold out data of 20%
                         )

summary(model)
plot(history)

# ------------------------------------------------------------------
# Step 3: Model evaluation on cross validation dataset

loss_and_metrics <- model %>% evaluate(test_x, test_y, batch_size = 128)
loss_and_metrics

# to check values for predict_classes
model %>% predict_classes(test_x[1:10,])

