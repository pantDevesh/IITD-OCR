#!/bin/bash

# This script is used by the API to load the given model into memory
# by running the corresponding docker container.
# Usage: 
# $> ./load.sh printed hindi v0 /home/krishna/ocr_images/

# Given the set of params such as modality, language, and image data dir.
# this script will start the docker container which in turn will run the flask
# server and load the model specified by the params in the memory.


MODALITY="$1"
LANGUAGE="$2"
VERSION="$3"
DATA_DIR="$4"

if [[ ! "$LANGUAGE" =~ ^(english|marathi|assamese|hindi|gujarati|gurumukhi|manipuri|bengali|oriya|punjabi|tamil|telugu|urdu|kannada|malayalam)$ ]]; then
	echo "Please enter a valid language (assamese, hindi, gujarati, gurumukhi, bengali, odia, punjabi, tamil, telugu, urdu, kannada, malayalam)"
	exit
fi


if [[ ! "$MODALITY" =~ ^(handwritten|scene_text|printed)$ ]]; then
	echo "Please enter a valid modality (handwritten, scene_text, printed)"
	exit
fi


echo "Performing Inference for $LANGUAGE $MODALITY Task"

# path to the saved model.
MODEL_DIR="/home/ashishpapanai/Downloads/model_templates/urdu_docker/outside/model"

echo "Checking for model dir"
if [ ! -d "$MODEL_DIR" ]; then
	echo "$MODEL_DIR : No such Directory"
	exit
else
	echo -e "MODEL_DIR\t$MODEL_DIR"
fi

echo "Checking for data dir"
if [ ! -d "$DATA_DIR" ]; then
	echo "$DATA_DIR : Enter a valid data directory"
	exit
else
	echo -e "DATA_DIR\t$DATA_DIR"
fi

CONTAINER_NAME="infer-$(echo $MODALITY)-$(echo $LANGUAGE)-$(echo $VERSION)"
echo "Starting the inference in detached docker container: $CONTAINER_NAME"

#CROPPED_DIR="/home/ashishpapanai/Downloads/model_templates/ocr_outside/data/cropped"

docker run -d --name=$CONTAINER_NAME --user $(id -u):$(id -g) --cpuset-cpus="0-2" --gpus all \
	-v $MODEL_DIR:/model \
	-v $DATA_DIR:/data \
	str:iitd_urdu \
	python app.py


#docker run -d --name=$CONTAINER_NAME --user $(id -u):$(id -g) --cpuset-cpus="0-2" --gpus all str:iitd 

#docker run -d --name=$CONTAINER_NAME --user $(id -u):$(id -g) --cpuset-cpus="0-2" --gpus all test_iitd
