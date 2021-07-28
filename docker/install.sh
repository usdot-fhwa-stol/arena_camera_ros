#!/bin/bash

#  Copyright (C) 2018-2021 LEIDOS.
# 
#  Licensed under the Apache License, Version 2.0 (the "License"); you may not
#  use this file except in compliance with the License. You may obtain a copy of
#  the License at
# 
#  http://www.apache.org/licenses/LICENSE-2.0
# 
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#  License for the specific language governing permissions and limitations under
#  the License.

# Install SDK
cd ~/src/CARMAArenaCameraDriver
# curl -L https://github.com/usdot-fhwa-stol/arena_camera_ros/raw/feature/restructure/ArenaSDK_v0.1.54_Linux_x64.tar.gz > ArenaSDK_v0.1.54_Linux_x64.tar.gz
tar -xzf ArenaSDK_v0.1.54_Linux_x64.tar.gz
sudo cp -ar ArenaSDK_Linux_x64 /opt
sudo cp ~/src/CARMAArenaCameraDriver/image_encodings.h /opt/ArenaSDK_Linux_x64/image_encodings.h
cd /opt/ArenaSDK_Linux_x64
sudo sh Arena_SDK.conf
echo "export ARENA_ROOT=/opt/ArenaSDK_Linux_x64" >> ~/.bashrc
echo "export ARENA_CONFIG_ROOT=/opt/carma/" >> ~/.bashrc
source ~/.bashrc
sudo cp /opt/ros/kinetic/include/sensor_msgs/image_encodings.h /opt/ros/kinetic/include/sensor_msgs/image_encodings.h.bak
sudo cp /opt/ArenaSDK_Linux_x64/image_encodings.h /opt/ros/kinetic/include/sensor_msgs/image_encodings.h

source /opt/ros/kinetic/setup.bash
cd ~/
colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release
