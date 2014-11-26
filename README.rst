  Puppetized  Openduty
========================

  Here you can see all commands wich we need to install openduty,so I make the same thing but for Puppet.

  sudo easy_install pip
  sudo pip install virtualenv
  virtualenv env
  . env/bin/activate
  pip install -r requirements.txt
  export DJANGO_SETTINGS_MODULE=openduty.settings_dev
  python manage.py syncdb
  python manage.py migrate
  python manage.py runserver

1.Install VirtualBox
====================

2.Install Vagrant
===================

3.Add box for Vagrant
=====================

  (I used Centos 6.5 box ,with puppet)

4.Get Github Repository
========================

  $git clone https://github.com/Karen09/Openduty-Puppetized.git

5.Change directory to Openduty-puppetized-
==========================================

  $cd Openduty-Puppetized/

6.Add puppet firewall modules
=============================

  $ git submodule update --init

7.Run vagrant
============

  $vagrant up

8.Log In Openduty
==================

  go to ->  192.168.33.10:8000

  #User and Passwd is default

  user:root

  passwd:toor

9.Extra Info
=============

  I will wait for Feedback`s . thanks
