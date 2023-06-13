lex@gblex:~$ snap --help
The snap command lets you install, configure, refresh and remove snaps.
Snaps are packages that work across many different Linux distributions,
enabling secure delivery and operation of the latest apps and utilities.

Usage: snap <command> [<options>...]


lex@gblex:~$ snap list
Name                       Version           Rev    Tracking         Publisher   Notes
bare                       1.0               5      latest/stable    canonical✓  base
core20                     20230503          1891   latest/stable    canonical✓  base
core22                     20230531          750    latest/stable    canonical✓  base
firefox                    114.0.1-1         2760   latest/stable/…  mozilla✓    -
gnome-3-38-2004            0+git.6f39565     140    latest/stable/…  canonical✓  -
gnome-42-2204              0+git.587e965     105    latest/stable    canonical✓  -
gtk-common-themes          0.1-81-g442e511   1535   latest/stable/…  canonical✓  -
snap-store                 41.3-71-g709398e  959    latest/stable/…  canonical✓  -
snapd                      2.59.4            19361  latest/stable    canonical✓  snapd
snapd-desktop-integration  0.9               83     latest/stable/…  canonical✓  -
lex@gblex:~$


lex@gblex:~$ snap find chromium
Name                      Version         Publisher        Notes  Summary
chromium                  114.0.5735.106  canonical✓       -      Chromium web browser, open-source version of Chrome
chromium-ffmpeg           0.1             canonical✓       -      FFmpeg codecs (free and proprietary) for use by third-party browser snaps
chromium-ffmpeg-test      0.1             osomon           -      Test snap that exercises the slots exposed by chromium-ffmpeg
flashcardsmobile          1.0.0           pjacksonlink     -      The ultimate flashcards app.
boxy-svg                  3.96.0          jarek-foksa      -      Scalable Vector Graphics (SVG) editor
pocket-browser            1.8.0           pocketinc        -      An open-source browser made for privacy and going towards security!
nativefier                50.1.1          kz6fittycent     -      Nativefier is a command-line tool to easily create a “desktop app”
electronim                0.0.93          marcnuri         -      Free/Libre open source Electron based multi instant messaging (IM) client.
linux-search-everything   1.0.0           jalejandroc2928  -      A faster and more flexible File Browser for Linux
restart-chromium          1               mgibbs-dfrs      -      Restart Browser
dashkiosk-client-browser  0.1             ogra             -      Chromium in Kiosk mode specifically adjusted for dashkiosk
lex@gblex:~$


lex@gblex:~$ snap info chromium
name:      chromium
summary:   Chromium web browser, open-source version of Chrome
publisher: Canonical✓
store-url: https://snapcraft.io/chromium
contact:   https://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bugs?field.tag=snap
license:   Apache-2.0 AND BSD-3-Clause AND LGPL-2.0 AND LGPL-2.1 AND MIT AND MS-PL AND (GPL-2.0+ OR LGPL-2.1+ OR MPL-1.1)
description: |
  An open-source browser project that aims to build a safer, faster, and more
  stable way for all Internet users to experience the web.
snap-id: XKEcBqPM06H1Z7zGOdG5fbICuf8NWK5R
channels:
  latest/stable:    114.0.5735.106 2023-06-09 (2497) 157MB -
  latest/candidate: 114.0.5735.106 2023-06-06 (2497) 157MB -
  latest/beta:      115.0.5790.24  2023-06-08 (2500) 159MB -
  latest/edge:      116.0.5817.0   2023-06-09 (2502) 158MB -
lex@gblex:~$


lex@gblex:~$ sudo snap install chromium
[sudo] password for lex:
chromium 114.0.5735.106 from Canonical✓ installed
lex@gblex:~$


lex@gblex:~$ sudo find / -type d -name chromium 2>/dev/null
/root/snap/chromium
/snap/chromium
/home/lex/snap/chromium
/home/lex/snap/chromium/common/chromium
/tmp/snap-private-tmp/snap.chromium/tmp/.snap/snap/chromium
/var/snap/chromium
lex@gblex:~$


lex@gblex:~$ snap list
Name                       Version           Rev    Tracking         Publisher      Notes
bare                       1.0               5      latest/stable    canonical✓     base
chromium                   114.0.5735.106    2497   latest/stable    canonical✓     -
core20                     20230503          1891   latest/stable    canonical✓     base
core22                     20230531          750    latest/stable    canonical✓     base
cups                       2.4.2-5           872    latest/stable    openprinting✓  -
firefox                    114.0.1-1         2760   latest/stable/…  mozilla✓       -
gnome-3-38-2004            0+git.6f39565     140    latest/stable/…  canonical✓     -
gnome-42-2204              0+git.587e965     105    latest/stable    canonical✓     -
gtk-common-themes          0.1-81-g442e511   1535   latest/stable/…  canonical✓     -
snap-store                 41.3-71-g709398e  959    latest/stable/…  canonical✓     -
snapd                      2.59.4            19361  latest/stable    canonical✓     snapd
snapd-desktop-integration  0.9               83     latest/stable/…  canonical✓     -
lex@gblex:~$


lex@gblex:~$ sudo snap remove chromium
chromium removed
lex@gblex:~$

lex@gblex:~$ snap list
Name                       Version           Rev    Tracking         Publisher      Notes
bare                       1.0               5      latest/stable    canonical✓     base
core20                     20230503          1891   latest/stable    canonical✓     base
core22                     20230531          750    latest/stable    canonical✓     base
cups                       2.4.2-5           872    latest/stable    openprinting✓  -
firefox                    114.0.1-1         2760   latest/stable/…  mozilla✓       -
gnome-3-38-2004            0+git.6f39565     140    latest/stable/…  canonical✓     -
gnome-42-2204              0+git.587e965     105    latest/stable    canonical✓     -
gtk-common-themes          0.1-81-g442e511   1535   latest/stable/…  canonical✓     -
snap-store                 41.3-71-g709398e  959    latest/stable/…  canonical✓     -
snapd                      2.59.4            19361  latest/stable    canonical✓     snapd
snapd-desktop-integration  0.9               83     latest/stable/…  canonical✓     -
lex@gblex:~$


lex@gblex:~$ sudo find / -type d -name chromium 2>/dev/null
/root/snap/chromium
/home/lex/snap/chromium
/tmp/snap-private-tmp/snap.chromium/tmp/.snap/snap/chromium
lex@gblex:~$
