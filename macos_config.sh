#!/bin/sh

brew install dockutil
. "macOS/dock.sh" && echo "Dock reloaded."
. "macOS/defaults.sh" && echo "macOS Defaults loaded."