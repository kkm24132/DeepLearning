
# Deep Learning

**```Wiki Definition: Deep learning is part of a broader family of machine learning methods based on artificial neural networks with representation learning. Learning can be supervised, semi-supervised or unsupervised. ```**

Deep Learning is a subset of Machine Learning. It deals with deep neural networks. It is based on a set of algorithms / program components that attempt to model high level abstractions in the dataset by using multiple processing layers with complex structures or otherwise composed of multiple non-linear transformations.

These are powerful when dataset is large and can manage multiple functions in parallel.

## 1. Why Deep Learning?

![plot of Why Deep Learning Needed](/WhyDeepLearning.png)

## 2. Learning Specifics

- Please refer and follow from [here on **Learning Specifics**](https://github.com/kkm24132/DeepLearning/tree/master/Learning)

## 3. Major Deep Learning Types

- [X] _Unsupervised pretrained networks (UPNs)_
- [X] _Convolutional neural networks (CNNs)_
- [X] _Recurrent neural networks (RNN)_
- [X] _Recursive neural networks_
- [X] _LSTMs (Long Short Term Memory)_

## 4. Use Cases of Deep Learning 
(Non-Exhaustive List)
- [X] _Face recognition_
- [X] _Image classification_
- [X] _Speech recognition_
- [X] _Text-to-Speech generation_
- [X] _Medical diagnosis_
- [X] _Machine translation_
- [X] _Handwriting transcription_
- [X] _Autonomous Cars: drivable area, lane keeping, smart driving_
- [X] _Digital assistants_
- [X] _Ads, search, social recommendations_

## 5. Deep Learning Framework (is an essential supporting fundamental structure that helps to make complexity of DL relatively simpler) 

Deep Learning Framework | Release Year|Langugage  |CUDA Supported?|Pre-trained Models?|
------------------------|-------------|-----------|---------------|-------------------|
TensorFlow (Google)     | 2015        |C++, Python| Yes           | Yes               |
Keras                   | 2015        |Python     | Yes           | Yes               |
PyTorch                 | 2016        |C, Python  | Yes           | Yes               |
Caffe                   | 2013        |C++        | Yes           | Yes               |
Deeplearning4j          | 2014        |C++, Java  | Yes           | Yes               |

Some of the additional DL frameworks are as follows:
* Theano (University of Montreal)
* MXNet (Amazon)
* Microsoft Cognitive toolkit - CNTK (Microsoft)
* Lasagne
* BigDL

## 6. Object Detection

- This is a great reference on [Basics of Object Detection - Part1](https://www.analyticsvidhya.com/blog/tag/object-detection/). It covers basic Object Detection algorithms.
  - CNN (Divides the image into multiple regions and then classify each region into various classes.)
  - RCNN (Uses selective search to generate regions. Extracts around 2000 regions from each image)
  - Fast RCNN (Each image is passed only once to the CNN and feature maps are extracted. Selective search is used on these maps to generate predictions. Combines all the three models used in RCNN together)
  - Faster RCNN (Replaces the selective search method with region proposal network which made the algorithm much faster.)
- This is the reference around [Object Detection - Part 2](https://www.analyticsvidhya.com/blog/2018/11/implementation-faster-r-cnn-python-object-detection/?utm_source=blog&utm_medium=a-step-by-step-introduction-to-the-basic-object-detection-algorithms-part-1)
- This is the reference around [Object Detection - Part 3](https://www.analyticsvidhya.com/blog/2018/12/practical-guide-object-detection-yolo-framewor-python/?utm_source=blog&utm_medium=a-step-by-step-introduction-to-the-basic-object-detection-algorithms-part-1) using YOLO Framework
- Key Algorithms: YOLO, YOLOv4, Scaled-YOLOv4, Faster RCNN, Fast RCNN, RetinaNet etc

## 7. Certification and Key References

- [fast.ai Link for learning](https://www.fast.ai/)
- deeplearning.ai Certification from Coursera (https://www.coursera.org/specializations/deep-learning)
  - Neural networks and Deep Learning
  - Improving deep neural networks
  - Structuring ML projects
  - Convolutional neural networks
  - Sequence models
- Deep learning notes from Coursera DL course by Andrew Ng - this may be useful for reference (https://lnkd.in/gBGaSDK)
- [Understanding and Coding using Python / R from scratch from AV](https://www.analyticsvidhya.com/blog/2020/07/neural-networks-from-scratch-in-python-and-r/)
- [Deploy an Image Classification Model using flask](https://www.analyticsvidhya.com/blog/2020/07/deploy-an-image-classification-model-using-flask/)
- Fundamentals and Concepts Build up
  - [Understanding of Tensors](https://www.analyticsvidhya.com/blog/2017/03/tensorflow-understanding-tensors-and-graphs/?utm_source=blog&utm_medium=comprehensive-popular-deep-learning-interview-questions-answers)
  - [Stanford CS224D on DL](https://cs224d.stanford.edu/syllabus.html)
  - [Hyperparameter Tuning, Regularization etc](https://www.analyticsvidhya.com/blog/2018/11/neural-networks-hyperparameter-tuning-regularization-deeplearning/?utm_source=blog&utm_medium=comprehensive-popular-deep-learning-interview-questions-answers)

## 8. Storage - GPU related options 
(Disclaimer: referenced from various sites as part of understanding - may not be up to date, please use for just reference, and check on your own)

Vendor offering GPU storage options | K80 offering |V100 offering  |Storage provisioning | Remarks             |
------------------------------------|--------------|---------------|---------------------|---------------------|
Google Collab                       |Free          |Not sure       |Upto 15 GB           |TPU also offered free|
Kaggle Kernels                      |Free          |               |Upto 8 GB            |                     |
MSFT Azure                          |$0.87         |$2.95          |$0.10                |                     |
AWS                                 |$0.90         |$3.06          |$0.10                |                     |
Google Cloud Platform               |$1.21         |$3.24          |$0.03                |                     |
Spell                               |$0.90         |$3.06          |                     |                     |

## 9. Computer Vision 

### 9a. Use Cases

- SOP adherence to check for conformance 
- Classroom attentiveness
- Customer attributes identification in cross industry segments
- Robotic key dispenser
- Hotel Guest Customization
- Touchless workplaces
- Social Distancing

### 9b. Typical Production Stack

- A remote SSH login provider (e.g. Azure IoT, pubnub)
- A choice of processor and board (e.g. Jetson series, NXP)
- Discrete or in-built accelerator / GPU enabled AI applications (e.g. Google Coral, NCS2)
- IoT sensors depending on the requirement
- Protocol stack to send events to cloud (e.g. Hosted services offer AWS, MQTT)
- Server side event message processing system (e.g. Google Cloud Pub/Sub) - for ingesting event streams at scale
- NoSQL / Time series data storage system (e.g. InfluxDB)
- API and other services (especially serverless)
- Device code deployment and OTA capabilities along with heartbeat status for debugging
- For cloud based AI application: additional model training pipeline on the server to process cleaned data, build new models, test and evaluate new models etc
- Offline code capabilities so that it can be reproducible and to handle all no internet scenarios

![plot of StreamAnalytics flow architecture](/StreamAnalytics_Google.png)

## 10. Deep learning using R - Examples

### Keras and tensorflow usage in R

* MNIST dataset is leveraged to identify and predict digits
* Temperature-forecasting problem, where you have access to a time series of data points coming from sensors installed on the roof of a building, such as temperature, air pressure, and humidity,which is used to predict what the temperature will be 24 hours after the last data point

## 11. Deep learning using Python - Examples

### Keras implementation of Image OutPainting
This is an implementation of [Painting Outside the Box: Image Outpainting](https://cs230.stanford.edu/projects_spring_2018/posters/8265861.pdf) paper from Standford University. Some changes have been made to work with 256*256 image.

This approach extends the use of Generative Adversarial Networks for inpainting to estimate and imagine what the existing image might look like beyond what can be seen. Then the algorithm expands the image and paints what it has estimated - and the results as outpainting...

* Inclusion of Identity loss i.e from generated image to the original image
* Removing patches from training data (training pipeline)
* Replacing masking with cropping (training pipeline)
* Inclusion of convolution layers


#### a) Prepare Data: 
```sh
# Downloads the beach data and converts to numpy batch data
# saves the Numpy batch data to 'data/prepared_data/'
sh prepare_data.sh
```

#### b) Build Model: 
```sh
# To build Model from scratch you can directly run 'outpaint.ipynb' 
# OR
# You can Download my trained model and move it to 'checkpoint/' and run it.
```


#### c) Results
The model trained with [beach data](http://cvcl.mit.edu/scenedatabase/coast.zip)  for 200 epochs.
![Demo](/Image_Outpainting/data/beachdata1.png)

#### Recursive painting
![Demo](/Image_Outpainting/data/beachdata2.png)


