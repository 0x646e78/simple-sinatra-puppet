simple-sinatra-puppet
=====================

Puppet recipes and Kickstart file to deploy a simple Sinatra application.


About
-------

Previous to receiving this task, I had gotten as far as installing Puppet inside one of my VM's and having a quick read through some docs.  I took this as a challenge to give myself a quick crash-course in Puppet.  The resulting recipes are based on a few hours research over a couple of evenings and a fair bit of trial and error.

I have deployed this system under KVM using CentOS6.4 x86_64 minimal, via kickstart.  
My kickstart file is included, which specifies the IP for host puppet in /etc/hosts.  This will need to be changed if you are to use this kickstart.  root password is set as  'passphrase'.

The sinatra server hostname is set as 'gamma.centaurus', which is also specified in the apache vhost (via puppet).

Puppet adds a single user, joe.smith, with SSH key access using the included key pair (key passphrase is 'password'). Root access, and password authentication is disabled in sshd_config.  Joe has sudo access through his group membership.  His user password is set to 'changeme'.


Installation
-------------

Install a base (RHEL6/Variant) system, install puppet on this system.

The recipes have been written using a Puppet master, and as such will need some editing to work with 'puppet apply', which I will not cover here.

    git clone https://github.com/auraltension/simple-sinatra-puppet.git
    cd simple-sinatra-puppet/
    git submodule init
    git submodule update

You can then copy/move the contents of this directory into /etc/puppet to provision the sinatra server, followed by
    
    puppet cert list
    puppet cert sign gamma

And then on the base system:

    puppet agent --test


TODO
----

Given that this was an introduction to Puppet for me, the recipes are fairly hardcoded and could be a lot better.

* I can see that moving into template territory would be beneficial. 
* I could utilise more variables throughout.
* parameterized classes are something I need to dig into
* There is also a small amount of distribution checking, but is very much incomplete and will fail on non RHEL-based systems


Extra hardening options which I _could_ deploy
------------------------------------------------
*_of varying levels of usefulness and manageability_*

* ipv6 and associated iptables/config settings
* apache mod_security
* recompiled kernel, patch with grsec
* OSSEC
* Logwatch
* PSAD
* Partitioning out /home (nodev, nosuid) /tmp (nosuid, nodev, noexec) /usr (nodev), /var (
* chroot apache......


A Special note
---------------

No, I don't use these RSA keys (or passwords!) anywhere else, they were generated specifically for this project.
