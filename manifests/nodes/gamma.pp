node 'gamma' inherits basenode {
	include iptables
	include apache
	include ruby
	include sinatra
	include mod_passenger
	include simple-sinatra-app
}
