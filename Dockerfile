FROM osrf/ros:noetic-desktop-full

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-catkin-tools \
    python3-catkin-pkg \
    python3-osrf-pycommon \
    ros-noetic-can-msgs \
    ros-noetic-velocity-controllers \
    ros-noetic-velodyne-pointcloud \
    ros-noetic-teleop-twist-keyboard \
    ros-noetic-gazebo-ros \
    ros-noetic-gazebo-ros-control \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-hector-gazebo-plugins \
    ros-noetic-hector-gazebo-worlds \
    ros-noetic-hector-gazebo \
    ros-noetic-ros-controllers \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws/src
COPY ./ /root/catkin_ws/src/FIRA-Autonomous-Cars-Simulator/
WORKDIR /root/catkin_ws
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin_make"
RUN echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc
CMD ["bash"]
