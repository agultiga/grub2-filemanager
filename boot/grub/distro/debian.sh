set icon="debian";
if test -f (loop)/live/vmlinuz; then
	set vmlinuz_img="(loop)/live/vmlinuz";
else
	set vmlinuz_img="(loop)/live/vmlinuz*";
fi
set initrd_img="(loop)/live/initrd.*";
set loopiso="findiso=${isofile}";

menuentry "作为 Debian LiveCD 启动" --class $icon{
	set kcmdline="boot=live config";
	linux $vmlinuz_img $kcmdline $loopiso;
	initrd $initrd_img;
}
menuentry "作为 Debian Overlay CD 启动 (适用于 Clonezilla/GParted ISO)" --class $icon{
		set kcmdline="boot=live config union=overlay username=user";
		linux $vmlinuz_img $kcmdline $loopiso;
		initrd $initrd_img;
}
menuentry "作为 Debian LiveCD 启动 (安全模式)" --class $icon{
	set kcmdline="boot=live components memtest noapic noapm nodma nomce nolapic nomodeset nosmp nosplash";
	linux $vmlinuz_img $kcmdline $loopiso;
	initrd $initrd_img;
}