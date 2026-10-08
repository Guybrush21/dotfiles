#!/usr/bin/env bash
nmcli device wifi rescan 2>/dev/null

# Lista reti: "SSID<TAB>segnale<TAB>sicurezza<TAB>in uso", senza SSID vuoti né duplicati
networks=$(nmcli -t -f IN-USE,SSID,SIGNAL,SECURITY device wifi list --rescan no |
  awk -F: '$2 != "" && !seen[$2]++ {
    sec = ($4 == "" || $4 == "--") ? "" : "󰌾"
    mark = ($1 == "*") ? "  (connessa)" : ""
    printf "%s\t%s%%\t%s%s\n", $2, $3, sec, mark
  }')

[ -z "$networks" ] && { notify-send "Wifi" "Nessuna rete trovata"; exit 0; }

index=$(printf '%s\n' "$networks" | column -t -s $'\t' | rofi -dmenu -i -format i -p "Wifi") || exit 0
ssid=$(printf '%s\n' "$networks" | sed -n "$((index + 1))p" | cut -f1)
[ -z "$ssid" ] && exit 0

if nmcli -t -f NAME connection show | grep -Fxq "$ssid"; then
  result=$(nmcli connection up id "$ssid" 2>&1)
else
  security=$(printf '%s\n' "$networks" | awk -F'\t' -v s="$ssid" '$1 == s { print $3 }')
  if [ -n "$security" ]; then
    password=$(rofi -dmenu -password -p "Password $ssid" </dev/null) || exit 0
    result=$(nmcli device wifi connect "$ssid" password "$password" 2>&1)
  else
    result=$(nmcli device wifi connect "$ssid" 2>&1)
  fi
fi

if [ $? -eq 0 ]; then
  notify-send "Wifi" "Connesso a $ssid"
else
  notify-send -u critical "Wifi" "Connessione a $ssid fallita\n$result"
fi
