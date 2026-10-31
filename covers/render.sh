#!/bin/sh
# Renders every cover from covers/template.html into images/ as a 1600×840 JPEG.
# Usage: covers/render.sh [slug]  (no slug renders them all)
set -e
cd "$(dirname "$0")/.."

chrome="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

render() {
  slug=$1
  [ -z "$only" ] || [ "$only" = "$slug" ] || return 0
  "$chrome" --headless --hide-scrollbars --window-size=800,420 --force-device-scale-factor=2 \
    --screenshot="$tmp/$slug.png" "file://$PWD/covers/template.html?shot=$slug&$2" 2>/dev/null
  sips -s format jpeg -s formatOptions 85 "$tmp/$slug.png" --out "images/$slug.jpg" >/dev/null
  echo "images/$slug.jpg"
}

only=$1

render zero             "zoom=1.2&y=45"
render jessewspencer    "zoom=1.15&x=30&y=60"
render laser-head       "zoom=1.6&x=0&y=90"
render rainbow          "zoom=1.2&y=62"
render constellation    "zoom=1.4&x=38&y=55"
render five             "zoom=1.3&x=0&y=14"
render keyboard-ui      "zoom=2.1&y=50"
render skeuo-ui         "zoom=1.55&y=50"
render brooding-hopster "zoom=1"
