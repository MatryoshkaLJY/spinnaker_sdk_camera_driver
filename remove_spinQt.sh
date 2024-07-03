#!/bin/bash

MY_YESNO_PROMPT='[Y/n] $ '

echo "This is a script to assist with the removal of the Spinnaker QT."
echo "Continue?"
echo -n "$MY_YESNO_PROMPT"
read confirm
if ! ( [ "$confirm" = "y" ] || [ "$confirm" = "Y" ] || [ "$confirm" = "yes" ] || [ "$confirm" = "Yes" ] || [ "$confirm" = "" ] )
then
    exit 0
fi

echo
echo "Removing Spinnaker QT packages..."

dpkg -l | grep 'spinview-qt.*-dev' | awk '{print $2}' | xargs -n1 -r sudo dpkg -P
dpkg -l | grep 'spinview-qt.*' | awk '{print $2}' | xargs -n1 -r sudo dpkg -P

echo "Uninstallation complete."
exit 0
