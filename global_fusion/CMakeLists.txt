cmake_minimum_required(VERSION 2.8.3)
project(global_fusion)

set(CMAKE_BUILD_TYPE "Release")
set(CMAKE_CXX_FLAGS "-std=c++11")
set(CMAKE_CXX_STANDARD 14)
#-DEIGEN_USE_MKL_ALL")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -Wall -g")
# 使用配置文件
include(${CMAKE_CURRENT_LIST_DIR}/../config/Dependencies.cmake)

## ==== OpenCV ====
# HACK by WLL @ 2023.04.13
# find_package(OpenCV REQUIRED)
find_package(OpenCV 4 REQUIRED CONFIG)
include_directories(${OpenCV_INCLUDE_DIRS})
message(STATUS "==> OpenCV_INCLUDE_DIRS = ${OpenCV_INCLUDE_DIRS} ")

## ==== Ceres ====
# HACK by WLL @ 2023.04.13
find_package(Ceres REQUIRED CONFIG)
include_directories(${CERES_INCLUDE_DIRS})
message(STATUS "==> CERES_INCLUDE_DIRS = ${CERES_INCLUDE_DIRS}")

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
)


add_subdirectory(./ThirdParty/GeographicLib/)

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${CERES_INCLUDE_DIRS}
  ./ThirdParty/GeographicLib/include/
)


catkin_package()


add_executable(global_fusion_node 
	src/globalOptNode.cpp
	src/globalOpt.cpp)

target_link_libraries(global_fusion_node ${catkin_LIBRARIES} ${CERES_LIBRARIES} libGeographiccc) 