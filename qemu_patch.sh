#!/usr/bin/env bash

#git clone https://gitlab.com/qemu-project/qemu.git
#cd qemu
#git submodule init
#git submodule update --recursive

gsed -i "/Q_KEY_CODE_ESC.*= *ADB_KEY_ESC/a\    [Q_KEY_CODE_ISO_SECTION]   = ADB_KEY_ISO," hw/input/adb-kbd.c
gsed -i "/ADB_KEY_GRAVE_ACCENT = 0x32,/i\    ADB_KEY_ISO = 0x0a," include/hw/input/adb-keys.h
gsed -i "s/\( *'lang1', *'lang2'\) *] *}/\1, 'iso_section' ] }/" qapi/ui.json
gsed -i "s/\( *'lang1', *'lang2' *,\)\(.*\)/\1 'iso_section', \2/" qapi/ui.json
gsed -i "/kVK_ANSI_Grave.*= *Q_KEY_CODE_GRAVE_ACCENT/a\    [kVK_ISO_Section] = Q_KEY_CODE_ISO_SECTION," ui/cocoa.m
gsed -i "s/KEY_ISO,170,ISO_Section,0xa,,,,,,,,,,,,I178,,,/KEY_ISO,170,ISO_Section,0xa,,,,,,,,,,,,I178,iso_section,0x7c,0xa/" ui/keycodemapdb/data/keymaps.csv
gsed -i "s/KEY_ISO,,,,,,,,,,,,,,,I178,,,/KEY_ISO,,,,,,,,,,,,,,,I178,iso_section,0x7c,0xa/" ui/keycodemapdb/data/keymaps.csv

