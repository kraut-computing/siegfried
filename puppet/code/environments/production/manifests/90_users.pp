## This manifest manages users, groups and -rights on the system

## Groups list
# main group for supervisors
group {"supervisor" :
	gid    => 1000,
	ensure => 'present',
}



## USER list
account {"titzi":
	uid      => 1026,
	gid      => "supervisor",
	groups   => ["wheel"],
	realname => "Christopher Bross",
	sshkey   => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDfQGGH8SGwTTQxNG9QWVmT8KrQACPFHKG1euaGB8KW5UXA0oqygOUHQnMPh5XmgOrfOe5297chUaCDX4hIug8ixlViJuEgBJsJIoZIinrPQb+9mxMqm4/7AUmSo9OIRfhK8B06mwlDForPM5ULAPlpZLjyh3/oJEvsW3A+vEXOhq/CgwE6SbBJHxmypOfz3/n97pI99Aw4yqw32npZ6hzx9+FGa42c+FXPdRfM989iImkpspMf1DrF+9VD1iJfmwtnCyXwDXnLMMZ+wLmqiwDw07HXqAhEa9JF4BfUeZK8/CHBvUXMr5MlTNRiWoUiHBX9pcVftlEAq/zD2itQtdd9",
}

## user rights/ sudoers
class { 'sudo': }
sudo::conf { 'wheel':
	ensure  => present,
	content => '%wheel ALL=(ALL) NOPASSWD: ALL',
}

