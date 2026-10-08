wlr-randr --json | jq -r '
  "profile \(env.HOST // "attuale") {",
  (.[] |
    "\"\(.make) \(.model) \(.serial)\"" as $id |
    if .enabled then
      (.modes[] | select(.current)) as $m |
      "    output \($id) mode \($m.width)x\($m.height)@\($m.refresh)Hz position \(.position.x),\(.position.y) scale \(.scale) transform \(.transform)"
    else
      "    output \($id) disable"
    end),
  "}"'
