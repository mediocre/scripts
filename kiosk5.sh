#!/bin/bash

# Install updates
sudo apt update -y
sudo apt -qq upgrade -y
sudo apt -qq autoremove -y > /dev/null
sudo apt install -y x11-xserver-utils unclutter

AUTOSTART_PATH=$HOME/.config/labwc
mkdir -p $AUTOSTART_PATH

cat > $AUTOSTART_PATH/kiosk.sh <<EOF
#!/bin/bash

# Turn off screensaver and disable energysaver
xset s off
xset s noblank

while true;
do
  sleep 5

  # Remove the mouse cursor after 10 seconds of idleness
  unclutter -idle 10 -grab &

  # Ensure that if we have a power cut or bad shutdown that the chromium preferences are reset to a "good" state so we don't get the restore previous session dialog
  sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' $HOME/.config/chromium/Default/Preferences
  sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' $HOME/.config/chromium/Default/Preferences

  # Kill all Chromium processes
  pkill -o chromium

  chromium-browser --autoplay-policy=no-user-gesture-required --disable-background-timer-throttling --disable-extensions --disable-features=PowerSaverMode --disable-infobars --disable-media-stream --disable-renderer-backgrounding --hide-scrollbars --kiosk --no-default-browser-check --noerrdialogs --start-fullscreen \
  $1 &

  # Restart Chromium after an hour
  sleep 3600
done
EOF

chmod +x $AUTOSTART_PATH/kiosk.sh

if [[ ! -f $AUTOSTART_PATH/autostart ]]; then
  echo "$AUTOSTART_PATH/kiosk.sh" >> $AUTOSTART_PATH/autostart
else
  if grep -Fxq "@$AUTOSTART_PATH/kiosk.sh" $AUTOSTART_PATH/autostart; then
    echo "[SKIP] kiosk already setup"
  else
    echo "$AUTOSTART_PATH/kiosk.sh" >> $AUTOSTART_PATH/autostart
  fi
fi

sudo reboot
