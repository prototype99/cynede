# Compute paths
set(Caffe_INCLUDE_DIRS "/usr/include" "/opt/cuda/include")

# List of IMPORTED libs created by CaffeTargets.cmake
set(Caffe_LIBRARIES caffe-nv cuda cudart glog)

# Cuda support variables
set(Caffe_CPU_ONLY 0)
set(Caffe_HAVE_CUDA 1)
set(Caffe_HAVE_CUDNN 0)
