# mount-iso

* Mounts ISOs using udisksctl

* Tested with udisks2

# Howto

* From the command line:

```mount-iso.sh <path-to-iso-file>```

* A custom action for Thunar can also be created :
  (mount-iso.sh copied to /usr/bin as mount-iso)

~~~~
	<icon>application-x-cd-image</icon>
	<name>Mount ISO</name>
	<command>mount-iso %f</command>
	<patterns>*.iso</patterns>
	<other-files/>
~~~~
