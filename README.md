# cocoa-patch-for-qemu-french-keyboard


Qemu does not generate any keycode for a key of a mac with french keyboard (azerty).

No keycode is generated for the key just below the "esc" marked as "#/@"

After carefully studies french keyboards since the "Apple Extended Keyboard II" the missing key is added by this patch.

A series of "sed" scripts to add the missing key to qemu.

Requirements:
  - host:mac,
  - host keyboard: french
  - interface:cocoa (not usefull with X11/XQuartz interface)

Some references to Sun Type 5 keyboard can be find because this patch has been developped to fix an issue during the port of this project (https://www.gekk.info/articles/solaris26.htm) on a mac with a french keyboard.

2023-04-06:
  Update to support qemu 8.0.0
