# FROM osrf/ros:noetic-desktop
FROM osrf/ros:rolling-desktop

LABEL NAME="ortools_vendor" \
      VERSION="9.9.0" \
      MAINTAINER="Gonzalo Mier"

ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update --allow-insecure-repositories -y && \
    apt-get install -y --allow-unauthenticated --no-install-recommends ca-certificates

RUN apt-get install -y --allow-unauthenticated --no-install-recommends \
                    build-essential \
                    ca-certificates \
                    ros-rolling-ament-cmake-vendor-package \
                    git \
                    ranger \
                    vim

# WORKDIR /catkin_ws/src
WORKDIR /workspace


RUN git clone https://github.com/Fields2Cover/Fields2Cover

# COPY . /catkin_ws/src/ortools_vendor
# WORKDIR /catkin_ws/

COPY . /workspace/ortools_vendor




