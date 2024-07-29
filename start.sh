echo 'Preparing packages'
sudo apt-get update -y
sudo apt-get install -y repo git
echo 'cloning itself'
git clone https://github.com/Songkunda/kernelsu_pixel5
mkdir android-kernel && cd android-kernel
echo 'pulling kernel source'
repo init -u https://android.googlesource.com/kernel/manifest -b android-msm-redbull-4.19-android13-qpr2
repo sync
cd private/msm-google
echo 'cloning kernelsu'
git clone https://github.com/tiann/KernelSU
echo 'patching files'
ln -sf "/home/runner/android-kernel/private/msm-google/KernelSU/kernel" "/home/runner/android-kernel/private/msm-google/drivers/kernelsu"
echo "obj-y += kernelsu/" >> /home/runner/android-kernel/private/msm-google/drivers/Makefile
cp /home/runner/kernelsu_redbull/ksu.c /home/runner/android-kernel/private/msm-google/KernelSU/kernel/ksu.c
cp /home/runner/kernelsu_redbull/open.c /home/runner/android-kernel/private/msm-google/fs/open.c
cp /home/runner/kernelsu_redbull/exec.c /home/runner/android-kernel/private/msm-google/fs/exec.c
cp /home/runner/kernelsu_redbull/read_write.c /home/runner/android-kernel/private/msm-google/fs/read_write.c
cp /home/runner/kernelsu_redbull/stat.c /home/runner/android-kernel/private/msm-google/fs/stat.c
cp /home/runner/kernelsu_redbull/input.c /home/runner/android-kernel/private/msm-google/drivers/input/input.c
cd /home/runner/android-kernel
./build_redbull-gki.sh

# [AOSP源代码标记和 build](https://source.android.com/docs/setup/about/build-numbers?hl=zh-cn#build-ids-defined)
# TQ2A.230505.002	android-13.0.0_r43	Android13 Pixel 5	2023-05-05
# [驱动列表](https://developers.google.cn/android/drivers?hl=zh-cn)
# 适用于 Android 13.0.0 (TQ2A.230505.002) 的 Pixel 5 二进制文件
# 供应商映像 Google
# https://dl.google.com/dl/android/aosp/google_devices-redfin-tq2a.230505.002-3fdd0ec2.tgz?hl=zh-cn
# GPS、音频、相机、手势、图形、DRM、视频、传感器 Qualcomm
# https://dl.google.com/dl/android/aosp/qcom-redfin-tq2a.230505.002-f274a2f1.tgz?hl=zh-cn
