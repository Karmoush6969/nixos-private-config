#!/usr/bin/env bash

set -u

KITTY="/run/current-system/sw/bin/kitty"
KDOT="/run/current-system/sw/bin/kdotool"

# Top-left — fastfetch
"$KITTY" --title KARM-FASTFETCH -e bash -c 'fastfetch; exec bash' &

# Bottom-left — lavat
"$KITTY" --title KARM-LAVAT -e lavat &

# Top-right — tty-clock
"$KITTY" --title KARM-TTYCLOCK -e tty-clock -c -D &

# Bottom-right — cava
"$KITTY" --title KARM-CAVA -e cava &

sleep 2

# Find exact windows by their unique titles
FASTFETCH=$("$KDOT" search --title '^KARM-FASTFETCH$' | head -n 1)
LAVAT=$("$KDOT" search --title '^KARM-LAVAT$' | head -n 1)
CLOCK=$("$KDOT" search --title '^KARM-TTYCLOCK$' | head -n 1)
CAVA=$("$KDOT" search --title '^KARM-CAVA$' | head -n 1)

# Top-left — fastfetch
"$KDOT" windowmove "$FASTFETCH" 0 0
"$KDOT" windowsize "$FASTFETCH" 902 516

# Bottom-left — lavat
"$KDOT" windowmove "$LAVAT" 0 584
"$KDOT" windowsize "$LAVAT" 782 450

# Top-right — tty-clock
"$KDOT" windowmove "$CLOCK" 1344 20
"$KDOT" windowsize "$CLOCK" 548 263

# Bottom-right — cava
"$KDOT" windowmove "$CAVA" 1058 763
"$KDOT" windowsize "$CAVA" 876 271
