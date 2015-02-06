SHELL=/bin/bash

.PHONY: locations

locations:
	ln -s ${HOME}/.dotfiles/bin/locationchanger /usr/local/bin/locationchanger
	cp lib/LocationChanger.plist ${HOME}/Library/LaunchAgents/
	launchctl load ${HOME}/Library/LaunchAgents/LocationChanger.plist

