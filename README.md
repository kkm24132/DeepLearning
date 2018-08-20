
# Deep Learning

## Deep learning using R

###Keras and tensorflow usage in R

* MNIST dataset is leveraged to identify and predict digits
* Temperature-forecasting problem, where you have access to a time series of data points coming from sensors installed on the roof of a building, such as temperature, air pressure, and humidity,which is used to predict what the temperature will be 24 hours after the last data point

## Deep learning using Python

### Keras implementation of Image OutPainting
This is an implementation of [Painting Outside the Box: Image Outpainting](https://cs230.stanford.edu/projects_spring_2018/posters/8265861.pdf) paper from Standford University. Some changes have been made to work with 256*256 image:

* Inclusion of Identity loss i.e from generated image to the original image
* Removing patches from training data (training pipeline)
* Replacing masking with cropping (training pipeline)
* Inclusion of convolution layers


#### 1: Prepare Data: 
```sh
* Downloads the beach data and converts to numpy batch data
* saves the Numpy batch data to 'data/prepared_data/'
sh prepare_data.sh
```

#### 2: Build Model: 
```sh
To build Model from scratch you can directly run 'outpaint.ipynb' 
OR
You can Download my trained model and move it to 'checkpoint/' and run it.
```


#### 3: Results
The model was train with [beach data](http://cvcl.mit.edu/scenedatabase/coast.zip)  for 200 epochs.
![Demo](https://i.imgur.com/lmhhIqv.png)

#### Recursive painting
![Demo](https://i.imgur.com/RCp4Wzc.png)


