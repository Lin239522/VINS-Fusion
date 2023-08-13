# 指定自定义依赖库路径的辅助配置文件

# Eigen -- 直接使用系统的默认路径
set(EIGEN_INCLUDE_DIR "/usr/include/eigen3")

# Ceres -- 2.0.0 这里制定安装路径下的 cmake 文件所在的文件夹
set(Ceres_DIR           "/home/wll/Libraries/Install/Ceres-solver/ceres-2.0.0/lib/cmake/Ceres")
set(Ceres_INCLUDE_DIRS  ${Ceres_DIR}/../../../include)
# 注意： 这个 Ceres 编译时使用的 Eigen 版本和上面的 EIGEN_INCLUDE_DIR 对应的 Eigen 版本要一致

# OpenCV -- 4.2.0 这个也是 Ubuntu 20.04 的默认版本
set(OpenCV_DIR "/usr/lib/x86_64-linux-gnu/cmake/opencv4")
# 为了使得程序中的条件编译正确工作、切换为兼容 4.2.0 版本的代码，需要增加这个定义。
add_definitions(-DUSE_OpenCV4)
# 如果使用 OpenCV3 ，则注释掉上面这行宏定义

