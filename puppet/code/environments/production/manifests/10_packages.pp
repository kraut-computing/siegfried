## This manifest manages portage
## we use the portage module by ...
##
## This is to manage the packes and  eselect 


# add the provider (module)
Package { provider => 'portagegt' }

# package list
package { "app-admin/logrotate":
	ensure => latest;
}
package { "app-admin/puppet":
	ensure => latest;
}
package { "app-admin/sudo":
	ensure => latest;
}
package { "app-admin/syslog-ng":
	ensure => latest;
}
package { "app-arch/unrar":
	ensure => latest;
}
package { "app-arch/zip":
	ensure => latest;
}
package { "app-editors/emacs:24":
	ensure => latest;
}
package { "app-editors/nano":
	ensure => latest;
}
package { "app-editors/vim":
	ensure => latest;
}
package { "app-eselect/eselect-timezone":
	ensure => latest;
}
package { "app-misc/screen":
	ensure => latest;
}
package { "app-misc/sl":
	ensure => latest;
}
package { "app-misc/tmux":
	ensure => latest;
}
package { "app-portage/eix":
	ensure => latest;
}
package { "app-portage/gentoolkit":
	ensure => latest;
}
package { "app-portage/layman":
	ensure           => latest,
	package_settings => {
		use => "sync-plugin-portage",
	}
}
package { "app-shells/bash-completion":
	ensure => latest;
}
package { "app-shells/gentoo-bashcomp":
	ensure => latest;
}
package { "app-vim/undotree":
	ensure => latest;
}
package { "dev-libs/jemalloc":
	ensure => latest;
}
package { "dev-util/cmake":
	ensure => latest;
}
package { "dev-util/nvidia-cuda-sdk":
	ensure => latest;
}
package { "dev-util/valgrind":
	ensure => latest;
}
package { "dev-vcs/git":
	ensure => latest;
}
package { "net-fs/nfs-utils":
	ensure => latest;
}
package { "net-misc/dhcpcd":
	ensure => latest;
}
# NTP is managet in 10_services.pp
#package { "net-misc/ntp":
#	ensure => latest;
#}
package { "net-misc/openssh":
	ensure => latest;
}
package { "sys-apps/likwid":
	ensure => latest;
}
package { "sys-apps/mlocate":
	ensure => latest;
}
package { "sys-apps/portage":
	ensure => latest;
}
package { "sys-boot/grub:0":
	ensure => latest;
}
#package { "sys-devel/gcc":
#	ensure => latest;
#}
package { "sys-devel/gcc:4.8":
	ensure => latest;
}
# System compiler
package { "sys-devel/gcc:4.9":
	ensure => "4.9.3",
	notify => Eselect['gcc'],  # ALSO SEE 'eselect gcc' down the page
}
package { "sys-devel/gcc:5":
	ensure => latest;
}
package { "sys-infiniband/ofed:3.12":
	ensure           => latest,
	package_settings => {
		use => "perftest",
	};
}
package { "sys-kernel/genkernel":
	ensure => latest;
}
package { "sys-kernel/gentoo-sources:4.3.0":
	ensure => "4.3.0",
	notify => Eselect['kernel'],  # ALSO SEE 'eselect kernel' down the page
}
package { "sys-libs/freeipmi":
	ensure => latest;
}
package { "sys-process/cronie":
	ensure => latest;
}
package { "sys-process/htop":
	ensure => latest;
}
package { "virtual/cblas":
	ensure => latest;
}
package { "virtual/emacs":
	ensure => latest;
}
package { "virtual/mpi":
	ensure => latest;
}
package { "www-client/links":
	ensure => latest;
}


# use flages for dependany packages
package { "net-misc/iputils":
	package_settings => {
		use => "-caps -filecaps",
	}
}
package { "sys-libs/ncurses":
	package_settings => {
		use => "abi_x86_32",
	}
}
package { "x11-drivers/nvidia-drivers":
	package_settings => {
		use => "-tools uvm",
	}
}


# eselect setings
eselect { "gcc":
    listcmd => "gcc-config -l",
    setcmd  => "gcc-config",
    ensure  => "x86_64-pc-linux-gnu-4.9.3";
}
eselect { "editor":
	ensure  => "/bin/nano",
	require => Package['app-editors/nano'],
}
eselect { "timezone":
	ensure  => "Europe/Berlin",
	require => Package['app-eselect/eselect-timezone'],
}
eselect { "kernel":
	ensure  => "linux-4.3.0-gentoo",
}
eselect { "locale":
    ensure => "en_US.utf8";
}
