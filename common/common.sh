#!/bin/sh
# Common things used by all of pitools
# Copyright (c) Michael Nixon 2016.

# Colours
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'

# Reset to black
NC='\033[0m'

# Location we place our install mark files in
INSTALLMARKDIR="/pitools"

# Check for all common scripts
if [ ! -e "../common/check_root.sh" ]; then
  echo "Error: Common script missing - check_root.sh"
  exit 1
fi

if [ ! -e "../common/check_if_installed.sh" ]; then
  echo "Error: Common script missing - check_if_installed.sh"
  exit 1
fi

if [ ! -e "../common/mark_as_installed.sh" ]; then
  echo "Error: Common script missing - mark_as_installed.sh"
  exit 1
fi

if [ ! -e "../common/want_reboot.sh" ]; then
  echo "Error: Common script missing - want_reboot.sh"
  exit 1
fi

# Set variable names for all common scripts
SCRIPT_CHECK_ROOT="../common/check_root.sh"
SCRIPT_CHECK_IF_INSTALLED="../common/check_if_installed.sh"
SCRIPT_MARK_AS_INSTALLED="../common/mark_as_installed.sh"
SCRIPT_WANT_REBOOT="../common/want_reboot.sh"