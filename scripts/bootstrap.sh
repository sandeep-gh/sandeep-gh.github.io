pass=$1
#syspatch
adpass=`encrypt $pass`
useradd -m -L adming -p $adpass adming
usermod -G wheel adming
echo permit nopass :wheel >>/etc/doas.conf
pkg_add -uvi
su adming
doas pkg_add python3
