## This manifest maniges alle the different services
## dependencies:
## 	puppetlabs-ntp

# NTP
class { 'ntp':
	servers        => ['ntp0.fau.de','ntp1.fau.de','ntp2.fau.de','ntp3.fau.de'],
	package_ensure => latest,
}
