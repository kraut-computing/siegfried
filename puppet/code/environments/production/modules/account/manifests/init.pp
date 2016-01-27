## Defined type for creating virtual user accounts
## includinguser, group and ssh key

define account ($ensure="present", $uid, $gid, $groups=[], $realname, $sshkey, $sshkeytype="ssh-rsa") {
	$username = $title

	# create user
	user { "$username":
		ensure     => $ensure,
		uid        => $uid,
		gid        => $gid,
		groups     => $groups,
		comment    => $realname,
		shell      => "/bin/bash",
		managehome => "true",
		home       => "/home/$username",
		require    => Group[$gid,$groups],
	}

	# create groups (if nessercery)
	ensure_resource('group', [$gid, $groups], {ensure => 'present'})

	# set ssh key for user
	ssh_authorized_key { "default-ssh-key-for-$username":
		ensure  => $ensure,
		user    => "$username",
		type    => "$sshkeytype",
		key     => "$sshkey",
		name    => "$username",
		require => User["$title"],
	}
}
