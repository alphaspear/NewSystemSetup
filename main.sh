#!/bin/bash
echo running script 
echo

echo updating repos and upgrading
sudo apt update
sudo apt upgrade -y

echo Setting up monitors
/bin/bash monitorSetup.sh
echo running again
/bin/bash monitorSetup.sh
echo running again
/bin/bash monitorSetup.sh

echo
echo installing prerequisites
/bin/bash preRequirementsInstall.sh

echo
echo setting repositories
/bin/bash repoSetup.sh

echo
echo installing apps
/bin/bash appInstaller.sh

echo
echo Downloading and installing python packages
/bin/bash pythonPackagesInstall.sh

echo
echo removing unused apps
/bin/bash removeApps.sh

echo
echo docker permission setup
/bin/bash dockerUserSetup.sh

echo
echo installing OhhMyZSH
/bin/bash omzInstall.sh

echo
echo Downloading and installing non APT softwares
/bin/bash downloadAndInstall.sh

echo
echo adding path to .zshrc
/bin/bash pathConfig.sh
