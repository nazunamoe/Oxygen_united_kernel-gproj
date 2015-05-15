

# Do not execute this program with "./envsetup.sh" , simply source it with ". envsetup.sh"

defconfig=gkatt_bcm-perf_defconfig

export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=~/linaro-arm-eabi-4.9-master/bin/arm-cortex_a15-linux-gnueabihf-

bold=$(tput bold)
normal=$(tput sgr0)
bldrd=${bold}$(tput setaf 1)
bldgrn=${bold}$(tput setaf 2)
bldblu=${bold}$(tput setaf 4)

echo

if [ ! -f ./.config ];
then
	echo "${bldrd}[WARN]${normal} No .config detected."
	echo "${bldrd}[    ]${normal} Issue ${bldblu}make $defconfig${normal} to generate one."
else
	echo "${bldgn}[MESG]${normal} .config file detected!"
	echo "${bldgn}[    ]${normal} The build environment has been successfully set up."
fi

alias "ctop"="cd `pwd`"
alias "cmsm"="cd `pwd`/arch/arm/mach-msm"
alias "nconfig"="nano `pwd`/.config"

cat <<EOF

${bold}Build Environment Simple Reference:${normal}
	${bldblu}make mrproper${normal}			- cleans ALL build information, including .config
	${bldblu}make clean${normal}			- cleans last build output, saves .config
	${bldblu}make $defconfig${normal}	- copies the defconfig to .config
	${bldblu}make menuconfig${normal}			- spawns the .config editor
	${bldblu}make zImage${normal}			- builds the kernel, outputs to ./arch/arm/boot/zImage

${bold}Extra Useful Commands:${normal}
	${bldblu}ctop${normal}		- change the directory to the top of the kernel tree (`pwd`)
	${bldblu}cmsm${normal}		- change to the arch/arm/mach-msm directory
	${bldblu}nconfig${normal}		- nano the .config file (`pwd`/.config)

EOF
