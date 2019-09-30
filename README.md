
# Deep Learning

Deep Learning is a subset of Machine Learning. It deals with deep neural networks. It is based on a set of algorithms / program components that attempt to model high level abstractions in the dataset by using multiple processing layers with complex structures or otherwise composed of multiple non-linear transformations.
These are powerful when dataset is large and can manage multiple functions in parallel.

Major Deep Learning types are as follows:
```
* Unsupervised pretrained networks (UPNs)
* Convolutional neural networks (CNNs)
* Recurrent neural networks
* Recursive neural networks
```
Some key Use Cases of Deep Learning are as follows:
```
* Face recognition
* Image classification
* Speech recognition
* Text-to-Speech generation
* Medical diagnosis
* Machine translation
* Handwriting transcription
* Autonomous Cars: drivable area, lane keeping, smart driving
* Digital assistants
* Ads, search, social recommendations
```

Deep Learning Framework is an essential supporting fundamental structure that helps to make complexity of DL relatively simpler. Some of the top DL frameworks are described below:
```
* Tensorflow
* Theano
* Keras
* Caffe
* Torch
* Deeplearning4j
* MXNet
* Microsoft Cognitive toolkit
* Lasagne
* BigDL
```

Deep Learning Framework | Release Year|Langugage  |CUDA Supported?|Pre-trained Models?|
------------------------|-------------|-----------|---------------|-------------------|
TensorFlow              | 2015        |C++, Python| Yes           | Yes               |
Keras                   | 2015        |Python     | Yes           | Yes               |
PyTorch                 | 2016        |C, Python  | Yes           | Yes               |

## Deep learning using R

### Keras and tensorflow usage in R

* MNIST dataset is leveraged to identify and predict digits
* Temperature-forecasting problem, where you have access to a time series of data points coming from sensors installed on the roof of a building, such as temperature, air pressure, and humidity,which is used to predict what the temperature will be 24 hours after the last data point

## Deep learning using Python

### Keras implementation of Image OutPainting
This is an implementation of [Painting Outside the Box: Image Outpainting](https://cs230.stanford.edu/projects_spring_2018/posters/8265861.pdf) paper from Standford University. Some changes have been made to work with 256*256 image.

This approach extends the use of Generative Adversarial Networks for inpainting to estimate and imagine what the existing image might look like beyond what can be seen. Then the algorithm expands the image and paints what it has estimated - and the results as outpainting...

* Inclusion of Identity loss i.e from generated image to the original image
* Removing patches from training data (training pipeline)
* Replacing masking with cropping (training pipeline)
* Inclusion of convolution layers


#### 1: Prepare Data: 
```sh
# Downloads the beach data and converts to numpy batch data
# saves the Numpy batch data to 'data/prepared_data/'
sh prepare_data.sh
```

#### 2: Build Model: 
```sh
# To build Model from scratch you can directly run 'outpaint.ipynb' 
# OR
# You can Download my trained model and move it to 'checkpoint/' and run it.
```


#### 3: Results
The model was train with [beach data](http://cvcl.mit.edu/scenedatabase/coast.zip)  for 200 epochs.
![Demo](/Image_Outpainting/data/beachdata1.png)

#### Recursive painting
![Demo](/Image_Outpainting/data/beachdata2.png)


