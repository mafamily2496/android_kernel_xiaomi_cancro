export CCACHE=ccache
export DEFCONFIG=cancro_defconfig
export ARCH=arm
export CROSS_COMPILE=/run/media/majiaming/hdd1/gcc-linaro-5.5.0-2017.10-x86_64_arm-eabi/bin/arm-eabi-
export OUTDIR=/run/media/majiaming/hdd1/android_kernel_xiaomi_cancro
#make mrproper O=$OUTDIR
make -j4 $DEFCONFIG O=$OUTDIR
make -j4 O=$OUTDIR CONFIG_NO_ERROR_ON_MISMATCH=y
for i in `find -name *.ko`; do cp $i ../anykernel/modules/; done
#./dtbToolCM -s 2048 -d "qcom,msm-id = <" -2 -o arch/arm/boot/dt.img -p /usr/bin/ arch/arm/boot/
cp $OUTDIR/arch/arm/boot/zImage-dtb ../anykernel/Image.gz-dtb
#find $objdir -name '*.ko' -exec cp -av {} ../anykernel/modules/ \;
#cd ~/anykernel/AnyKernel2
#DATE=$(date +"%m-%d-%y")
#rm *.zip
#zip -r9 ZeurionX-$DATE.zip * -x README ZeurionX-$DATE.zip
#cp Z* public_html/
