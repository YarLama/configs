#!/bin/sh

# telegram run fix #1.
# When run any gnome-* programs, which using dbus, if run with sudo. Its broken telegram
# Need delete undependencies libraryes.

apt-get autoremove
