#!/bin/sh

# First we append the saved layout of workspace N to workspace M
(/usr/lib/polkit-kde-authentication-agent-1 &)
i3-msg "workspace --no-auto-back-and-forth 8:comm; append_layout ~/.config/i3/w2.json"
(slack &)
(thunderbird &)
i3-msg "workspace --no-auto-back-and-forth 7:other; append_layout ~/.config/i3/w3.json"
(google-chrome-stable &)

