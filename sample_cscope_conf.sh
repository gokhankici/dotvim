#!/bin/bash

PROJECT_FILE=IndependentFilm/src		# Location of the source files of the project
PROJECT_NAME=IndependentFilm			# Name of the project

cd /

#Find the java files in the project
find /home/gokhan/code/${PROJECT_FILE} -name "*.java" > /home/gokhan/cscope_databases/${PROJECT_NAME}/cscope.files

cd /home/gokhan/cscope_databases/${PROJECT_NAME}

#Create the database
cscope -b

#Add the database as an environment variable
export CSCOPE_DB=/home/gokhan/cscope_databases/${PROJECT_NAME}/cscope.out
