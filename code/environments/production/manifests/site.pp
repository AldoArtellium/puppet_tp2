node 'rogue1' {
        notify { 'HelloWorld!': }
	include sudo
	include ssh
}
