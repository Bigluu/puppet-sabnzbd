#sabnzbd

[![Build Status](https://travis-ci.org/DexterTheDragon/puppet-sabnzbd.png?branch=master)](https://travis-ci.org/DexterTheDragon/puppet-sabnzbd)

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with [sabnzbd]](#setup)
    * [What [sabnzbd] affects](#what-sabnzbd-affects)
    * [Beginning with [sabnzbd]](#beginning-with-sabnzbd)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

Puppet modules for installing sabnzbd+

##Module Description

Installs sabnzbd+, from the jcfp ppa by default. Also creates the required `/etc/default/sabnzbdplus` file and starts the service.

##Setup

###What [sabnzbd] affects

* By default adds the jcfp ppa
* Installs the sabnzbdplus package
* Creates the `/etc/default/sabnzbdplus` file
* Starts the sabnzbdplus service

###Beginning with [sabnzbd]

To install sabnzbdplus from ppa:jcfp/ppa and run it as `myuser`.

```
class { 'sabnzbd':
    user => 'myuser',
}
```

##Usage

To disable usage of the jcfp ppa and install from Ubuntu multiverse:

```
class { 'sabnzbd':
    use_ppa => false,
    user    => 'myuser',
}
```

##Reference

Classes
* sabnzbd

##Limitations

Ubuntu only currently.

##Development

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit your changes
* Send me a pull request. Bonus points for topic branches.

##Release Notes

See the [CHANGELOG](https://github.com/DexterTheDragon/puppet-sabnzbd/blob/master/CHANGELOG)
