
# Deep Learning

Deep Learning is a subset of Machine Learning. It deals with deep neural networks. It is based on a set of algorithms / program components that attempt to model high level abstractions in the dataset by using multiple processing layers with complex structures or otherwise composed of multiple non-linear transformations.
These are powerful when dataset is large and can manage multiple functions in parallel.

Major Deep Learning types are as follows:

* _Unsupervised pretrained networks (UPNs)_
* _Convolutional neural networks (CNNs)_
* _Recurrent neural networks_
* _Recursive neural networks_

Some key Use Cases of Deep Learning are as follows:

* _Face recognition_
* _Image classification_
* _Speech recognition_
* _Text-to-Speech generation_
* _Medical diagnosis_
* _Machine translation_
* _Handwriting transcription_
* _Autonomous Cars: drivable area, lane keeping, smart driving_
* _Digital assistants_
* _Ads, search, social recommendations_

Deep Learning Framework is an essential supporting fundamental structure that helps to make complexity of DL relatively simpler. 

Deep Learning Framework | Release Year|Langugage  |CUDA Supported?|Pre-trained Models?|
------------------------|-------------|-----------|---------------|-------------------|
TensorFlow              | 2015        |C++, Python| Yes           | Yes               |
Keras                   | 2015        |Python     | Yes           | Yes               |
PyTorch                 | 2016        |C, Python  | Yes           | Yes               |
Caffe                   | 2013        |C++        | Yes           | Yes               |
Deeplearning4j          | 2014        |C++, Java  | Yes           | Yes               |

Some of the additional DL frameworks are as follows:
* Theano
* MXNet
* Microsoft Cognitive toolkit
* Lasagne
* BigDL

## Notebook options

- [ ] Jupyter Notebook - Jupyter Notebook is an open source web application whose purpose is to create and share documents that contain live code, equations, visualizations and text. Jupyter Notebook is maintained by the people at Project Jupyter. They are an incidental project which originated from the IPython project. It supports languages of  Python, R and Julia. Their main use is in computational physics and data analysis. It provides a variety of visualisations which is rendered directly in the notebook. There are two modes that it has called insert and escape. Just like Colab, Jupyter notebooks are more focused on making work reproducible and easier to understand.
- [ ] Google Colab - Google Colaboratory is a cloud service that can be used for free of cost, provided by Google. It supports free GPU and is based on Google Jupyter Notebooks environment. It provides a platform for anyone to develop deep learning applications using commonly used libraries such as PyTorch, TensorFlow and Keras. It provides a way for your machine to not carry the load of heavy workout of your ML operations. It is one of the very popular platforms of the kind. But there are some others which form as efficient alternatives of Colab. These are the best alternatives available out there for Google colab.
- [ ] Kaggle Kernel - Kaggle is an excellent platform for deep learning applications in the cloud. Kaggle and Colab have a number of similarities, both being products of Google. Just like Colab, it lets the user use the GPU in the cloud for free. It provides Jupyter Notebooks in the browser . A majority of Jupyter Notebook keyboard shortcuts are exactly the same as Kaggle. It has many datasets that can be imported. Kaggle Kernels often seem to experience a little lag but is faster than Colab. Kaggle has a large community to support, learn and validate data science skills.
- [ ] Azure Notebooks - Azure notebooks by Microsoft is very similar to Colab in terms of functionality. Both platforms have a cloud sharing functionality available for free. Azure Notebooks wins in terms of speed and is much better than Colab in this regard. It has a memory of 4 gigabytes. Azure Notebooks creates a collection of related notebooks called Libraries. These libraries are the size of each data file as less than 100 megabytes. Azure Notebooks supports programming languages of Python, R and F#. It has a native Jupyter UI. Azure Notebooks is more suitable for simple applications.
- [ ] IBM Dataplatform Notebook - IBM introduced Watson Data Platform and Data Science Experience (DSX) back in 2016 with support for open-source options. These options included Apache Spark, R, Python, Scala and Jupyter notebooks. It eventually started its platform for multi-cloud freedom of choice for data science work. This was done with the help of containerization of the product by way of Kubernetes. As a result, it can be deployed in Docker or CloudFoundry containers wherever the data resides. IBM DataPlatform Notebooks, unlike Google Colab, have containerization for multi-cloud deployment or a hybrid deployment. Colab needs data science to be fone on its own public cloud.
- [ ] Amazon Sagemaker - Amazon SageMaker notebook runs on the Jupyter Notebook App. It is responsible to create and manage Jupyter notebooks that can further be used to process data and further train and deploy ML models. For the training and deployment of the models, it provides APIs. Amazon SageMaker provides a console that lets the user use the console UI to start model training or deploy a model. It allows for easy integration of ML models in applications. 

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


