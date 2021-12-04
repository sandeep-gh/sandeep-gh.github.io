pass=$1
#syspatch
adpass=`encrypt $pass`
useradd -m -L staff -p \"$adpass\" -G wheel adming
usermod -G wheel adming
echo "permit nopass :wheel" >>/etc/doas.conf
pkg_add -uvi
su adming -c "doas pkg_add python3; groupadd -g 1002 shared"
