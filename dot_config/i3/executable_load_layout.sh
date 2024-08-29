#!/bin/sh

# First we append the saved layout of workspace N to workspace M
i3-msg "workspace --no-auto-back-and-forth 1:main; append_layout ~/.config/i3/w1.json"
(kitty &)
(kitty &)
(kitty &)
(kitty &)
i3-msg "workspace --no-auto-back-and-forth 2:comm; append_layout ~/.config/i3/w2.json"
(slack &)
(thunderbird &)
i3-msg "workspace --no-auto-back-and-forth 3:browser; append_layout ~/.config/i3/w3.json"
(google-chrome-stable &)

