[![Udacity Machine Learning Status](https://circleci.com/gh/vtnha88/udacity-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/vtnha88/udacity-ml-microservice-kubernetes)

## Project Overview

IIn this project, you will have the opportunity to apply the knowledge and skills you have gained throughout this course to the practical task of operationalizing a Machine Learning Microservice API.

You will be working with a pre-trained machine learning model developed using the `sklearn` library. This model has been specifically trained to predict housing prices in the city of Boston based on a variety of key features, including factors like the average number of rooms in a home, data related to highway accessibility, teacher-to-pupil ratios, and more. The original dataset used to train this model was sourced from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing), a well-known data science platform.

The main objective of this project is to assess your ability to operationalize a Python Flask application, which is provided as the `app.py` file. This Flask app serves as the interface through which predictions about housing prices can be obtained by making API calls. Importantly, the principles demonstrated in this project are applicable to a wide range of pre-trained machine learning models, encompassing not only housing price prediction but also other domains such as image recognition and data labeling. Through this project, you will gain valuable hands-on experience in deploying machine learning models as real-world, accessible services.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Install Python3.7 (Ubuntu 20 Server)
```bash
  sudo add-apt-repository ppa:deadsnakes/ppa
  sudo apt-get update
  sudo apt-get install python3.7
  sudo apt-get install python3.7-dev python3.7-venv
  sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
  sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
  # Verify
  python3 -V
```
* Create a virtualenv and activate it by executing `python3 -m venv venv`
* Source the virtual environment: `source venv/bin/activate`
* Move to project directory:`cd udacity-ml-microservice-kubernetes`
* Run `make install` to install the necessary dependencies

### Running `app.py`
1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./upload_docker.sh && ./run_kubernetes.sh`

### Kubernetes Steps
* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

## Tasks
### Task 1. Complete the Dockerfile
* Specify your python version
* Specify a working directory.
* Copy the app.py source code to that directory
* Install any dependencies in requirements.txt (make install)
* Expose a port when the container is created (port 80 is standard).
* Specify that the app runs at container launch.

### Task 2. Run a Container & Make a Prediction
* Run the container using the run_docker.sh: `./run_docker.sh`
* Build the docker image from the Dockerfile
* List the created docker images
* Run the containerized Flask app; publish the container’s port (80) to a host port (8000).
* Run the prediction using the make_prediction.sh script: `./make_prediction.sh`
### Task 3. Improve Logging & Save Output
* Add a prediction log statement
* Run the container and make a prediction to check the logs
### Task 4. Upload the Docker Image
* Create a Docker Hub account
* Built the docker container with this command `docker build --tag=<your_tag>`.
* Authenticate and tag image
* Push your docker image to the dockerpath
* Run the upload using the upload_docker.sh script: `./upload_docker.sh`

### Task 5. Configure Kubernetes to Run Locally
* [Install Kubernetes](https://kubernetes.io/docs/tasks/tools/#install-kubectl-on-linux)
* [Install Minikube](https://minikube.sigs.k8s.io/docs/start/)
### Task 6. Deploy with Kubernetes and Save Output Logs
* Define a dockerpath which will be <docker_hub_username>/<project_name>, this should be the same name as your uploaded repository (the same as in upload_docker.sh)
* Run the docker container with kubectl; you’ll have to specify the container and the port
* List the kubernetes pods
* Forward the container port to a host port, using the same ports as before
* Run the kubernetes using run_kubernetes.sh script: `./run_kubernetes.sh`
### Task 7. Delete Cluster
If you want to delete the kubernetes cluster just run this command `minikube delete`. You can also stop the kubernetes cluster with this command `minikube stop`
### Task 8: CircleCI Integration
* Create a CircleCI Account (use your Github account for a better integration)
* Add a status badge using this template: [![<github_username>](https://circleci.com/gh/<github_username>/<repository>.svg?style=svg)](https://circleci.com/gh/<github_username>/<repository>) replace <github_username> and <repository> with your data. e.g: [![Udacity Machine Learning Status](https://circleci.com/gh/vtnha88/udacity-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/vtnha88/udacity-ml-microservice-kubernetes) and paste on top of your readme file.


## Directory Structure

| Directory/File | Description |
| ---- | ----------- |
| `.circleci/config.yml` | CircleCI configuration |
| `model_data` | Trained model data for housing prices in Boston |
| `output_txt_files` | Docker and Kubernetes log output |
| `app.py` | REST Endpoint for predicting housing prices in Boston |
| `Dockerfile` | Dockerfile containing the application and its dependencies |
| `make_prediction.sh` | Calls prediction REST endpoint and simulates sample prediction |
| `Makefile` | Build file of the project |
| `requirements.txt` | Python requirements |
| `run_docker.sh` | Shell script for creating and running docker container |
| `run_kubernetes.sh` | Shell script to deploy docker container on Kubernetes cluster |
| `upload_docker.sh` | Shell script for uploading locally built docker image to dockerhub repository |
