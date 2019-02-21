#!/bin/bash

BUILD_DIR=build

mkdir -p $BUILD_DIR
xsltproc darth.xml > $BUILD_DIR/index.html 
cp -r static/* $BUILD_DIR/

