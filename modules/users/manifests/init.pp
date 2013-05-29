class users {

	group { 'support':
	  ensure	=> present,
	  gid		=> 1000
	}

	user { 'joe.smith':
          ensure        => present,
	  comment	=> 'Joe Smith',
	  managehome	=> true,
	  uid		=> 600,
	  gid		=> 'support',
	  shell 	=> '/bin/bash',
	  password	=> '$6$aWO00N3pkIMg364D$ZOo.VnjGawkh1QQkpdZ9MiovmbPW4ZJebwHiRu1GvHQ6RvOK3Kwi0a9gg1hBEXuQXqRA63OumvdkO5HJ0DwAG.'
	}

	ssh_authorized_key { 'joe.smith':
	  ensure	=> present,
	  type		=> 'ssh-rsa',
	  user		=> 'joe.smith',
	  key		=> 'AAAAB3NzaC1yc2EAAAABIwAAAQEA3sKUjfuMaIhrc8idehUaMW+hbtZM5uOKJdWrRe4Xa6PxlzH8VGxF1lxt7jjRw+k47F4nN6WgNIUOTaTqtC+OfGYhzIbaw63/6XPGIZa4L8pGJkvpVRqt1WUkeYpcZwlpGUSD4bXaTrjtyYQN17/N0kYywgdjBsaHj9CDUxk8t5UFriYGyM1m5AhFnEpWwEBDLt9o+POhGebD+lN1jzw/dDfW+gEDpdnTVgrxkeOGurRABpEeKcnygNnJj5NFF/p/a8kOMsCi9VipNfscRyHlznzVEI2ht57q7BADnsc7uWh9uP5nO3KvOWy7T/D6Tnhsiu+elT9TKKtqE89XOZ9Eaw==',
	}
}
