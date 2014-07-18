xen-tools 4.4.rcis2-dev04 (Forked release  12-July-2014)
- Add patch for --dnssearch and --ntpsserver options to xen-create-image to provide ENV $dnssearch and $ntpserver
  this been used at the opensuse 40-setup-networking to handel variables at $prefix/etc/sysconfig/network/config
- more patching xen-create-image and 40-setup-networking for handling (open)suse ´s 13.1 Network setup syntax.

xen-tools 4.4.rcis2-dev03 (Forked release  12-July-2014)
- added  patch-fix --hash_method=expect as an bugfix workarround for the incompatible sha512 salt for opensuse / sles
  this expects  dir  /etc/xen-tools/expect exist and look for i.e an expect chat script opensuse-13.1-passwd.exp 
  This require perl modules  IPC::Cmd  and File::Copy on dom0 and expect to be installed in the domU.

- updated & moved to grub2  for opensuse13.1 hooks 23-setup-grub, 26-setup-kernel. <br>
  Thanks to Ismael Luceno for the patch Contribution.<br>
  This require copy of the pygrub  PYGRUB_VER = 0.6 , and an backport copy from xen 4.4 of the GrubConf.py <br>
  least to work & function.

xen-tools 4.4.rcis2-dev02 (Forked release  22-June-2014)
- added 24-setup-initramfs,
  busybox initramfs for opensuse 13.1 as an workaround for issues not mounted /dev/xvda2 , 
   caused by not automounted devtmpfs witch caused that the xenblk (xen bl front ) was not loated .
  oss 13.1 dracut BUG : don not generate an valid initramfs 
- oss 13.1 boots now  as centos6.5 with xen 4.4 domU - currenty with network issue.
- added oss13.1 hook 23-setup-udev-rules
- added oss13.1 hook 23-setup-grub 
- added oss13.1 hook 21-setup-keyboard
- added oss13.1 hook 22-setup-bashrc
- updated 95-clean-image, 90-make-fstab, 55-create-dev , 40-setup-networking

xen-tools 4.4.rcis2-dev01 (Forked release  14-June-2014)
- added experimental opensuse 13.1 hooek support.
- added prestage funtion for distros like opensuse to setup cleanly chroot - without  that  , the OSS autodeplyment failed .
- patched hardcoded /bin/ls /bin/cp with more sufficent : check /usr/bin and fllow and check symlikns
  This are required due LSB standard 2.3 / 3.0dev
- xen-tools & rinse Perl patches & fixes by Adrian Arnautu /Romania, Bucharest   arnautu dot adrian at gmail dot com

xen-tools 4.4.rcis1 (Forked release  27-Mai-2014)
======================================
 - Steve left, handed over to xen-tools.org Folks .
 - New xen-tools Maintainer : Alex Beckert.
 - xen-tools forked from xen-tools org in April 2014 for Remsnet LTD support patches 
 - centos 6.5 support added
 - centos 7.0 support added ( work in progress )
 - Opensuse 13.1 support added ( work in progress )
 - Fedora 19/20 support added ( work in progress )
 - updated rinse 
 - created rpm specs  for all depend rpm based deployments see https://github.com/remsnet/xen-tools-rpmbuild 

 Steven kemp Noted April 2014 to us :
 "Thanks for sharing, but you should know that I no longer take
  part in any xen-tools development. Instead the project was
  handed over to xen-tools.org folks who had more time and energy to continue  with it.
  Your contribution would be best shared with the mailing list here:
  http://xen-tools.org/mailman/listinfo/xen-tools-discuss
  Apologies for the slow reply; I've been on holiday.
  Steve
  -- 
  http://www.steve.org.uk/ "


xen-tools 4.3.1 (released 30-Jun-2012)
======================================

Bugfix Release only


xen-tools 4.3 (released 26-Jun-2012)
====================================

Bug Fixes
---------

* Fix several testuite failures depending on the build host's
  installation.

Other Changes
-------------

* Remove most Mercurial traces


xen-tools 4.3rc1 (released 08 Jun 2012)
=======================================

New Features and Major Changes
------------------------------

* Massive code deduplication in hooks directory

New Options
-----------

    --dontformat (xen-create-image)
    --finalrole  (xen-create-image)
    --apt_proxy  (xen-create-image)

Newly Supported Distribution Releases
-------------------------------------

* Ubuntu 11.10 Oneiric
* Ubuntu 12.04 Precise
* Ubuntu 12.10 Quantal
* CentOS 6


xen-tools 4.2.1 (released 17 Mar 2011)
======================================

Bugfix Release only


xen-tools 4.2 (released 05 Oct 2010)
====================================

First final release of the new Xen-Tools Team.

Supports Ubuntu up to 11.04 (Natty) and Debian up to 7.0 (Wheezy).


New Options
-----------

    --debootstrap-cmd (xen-create-image and xt-install-image)

New Features and Major Changes
------------------------------

* Uses hvc0 and xvda devices by default
* Also supports cdebootstrap
* Preliminary btrfs support.
* Uses GeoIP for Debian mirrors: Default Debian mirror is now
  cdn.debian.net, see http://wiki.debian.org/DebianGeoMirror for
  details.
* New helper program xt-guess-suite-and-mirror, used to find the
  default mirror and suite.
