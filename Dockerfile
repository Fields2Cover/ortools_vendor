FROM osrf/ros:rolling-desktop

LABEL NAME="ortools_vendor" \
      VERSION="9.9.0" \
      MAINTAINER="Gonzalo Mier"

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /workspaces/

RUN apt-get update --allow-insecure-repositories -y && \
    apt-get install -y --allow-unauthenticated --no-install-recommends ca-certificates

RUN apt-get install -y --allow-unauthenticated --no-install-recommends \
                    build-essential \
                    ca-certificates \
                    git \
                    ranger \
                    vim \
                    ros-rolling-ament-cmake-vendor-package

COPY . /workspace/ortools_vendor

WORKDIR /workspace/ortools_vendor




