** restore home

** sudo without passwd
sudo visudo
tole mors dat na dno
nejc ALL=(ALL) NOPASSWD:ALL
https://www.cyberciti.biz/faq/linux-unix-running-sudo-command-without-a-password/

** install mega

** terminal set columns, rows and font

*** install git
**** copy .ssh keys
**** chmod 600 id_rsa
**** chmod 644 id_rsa.pub

** synology help center
https://www.synology.com/en-global/support/download/DS220j?version=7.2#utilities

*** enable shuffle za eog
sudo apt-get install eog-plugins -y
in potem nastavitev v eog

then start eye of gnome, (terminal or not, doesn't matter for now), click
edit / preferences / plugins
Scroll down and check the "slideshow shuffle" box. Close the program.

*** vlc snap
sprobi ce dela, zadnjic je bil pol tole fix
https://askubuntu.com/questions/1311408/vlc-crashes-on-startup-qt-session-management-error-could-not-open-network-soc

*** disable snap notifications
For anyone annoyed by snap apps update notifications, disable it!
Go to your system settings -> Notifications and disable Snapd User Session Agent, Worked for me!

** install emacs snap
dodaj v .emacs file
(set-face-attribute 'default nil :height 200)
https://orgmode.org/manual/Activation.html#Activation
