## 

# masage of the day
file { '/etc/motd' :
	owner   => 'root',
	group   => 'root',
	mode    => '0644',
	content => "Welcome on Siegfried.\nThis node is not in production right now! Pleas don't make any chages whithout talking to Christopher Bross and Dominik Thoennes\n\n  NOTE: we now have user accounts!\n\n",
}
