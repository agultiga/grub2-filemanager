set icon="gnu-linux";
set vmlinuz_img="(loop)/boot/vmlinuz";
set initrd_img="(loop)/boot/core.gz";
set loopiso="iso=UUID=${devuuid}${isofile}";
menuentry "作为 TinyCore LiveCD 启动" --class $icon{
	set kcmdline="max_loop=256";
	linux $vmlinuz_img $kcmdline $loopiso;
	initrd $initrd_img;
}