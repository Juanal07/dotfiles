#!/bin/sh
draw() {
  ~/.config/lf/draw_img.sh "$@"
  exit 1
}

hash() {
  printf '%s/.cache/lf/%s' "$HOME" \
    "$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | awk '{print $1}')"
}

cache() {
  if [ -f "$1" ]; then
    draw "$@"
  fi
}

file="$1"
shift

if [ -n "$FIFO_UEBERZUG" ]; then
  case "$(file -Lb --mime-type -- "$file")" in
    image/*)
      orientation="$(identify -format '%[EXIF:Orientation]\n' -- "$file")"
      if [ -n "$orientation" ] && [ "$orientation" != 1 ]; then
        cache="$(hash "$file").jpg"
        cache "$cache" "$@"
        convert -- "$file" -auto-orient "$cache"
        draw "$cache" "$@"
      else
        draw "$file" "$@"
      fi
      ;;
    video/*)
      cache="$(hash "$file").jpg"
      cache "$cache" "$@"
      ffmpegthumbnailer -i "$file" -o "$cache" -s 0
      # mediainfo "$file"
      draw "$cache" "$@"
      ;;
    text/html) w3m -dump "$file" ;;
    text/troff) man ./ "$file" | col -b ;;
    application/zip) atool --list -- "$file" ;;
    audio/* | application/octet-stream) mediainfo "$file" ;;
    */pdf) pdftotext -l 10 -nopgbrk -q -- "$file" - ;;
    *opendocument*) odt2txt "$file" ;;
    *) bat --theme=gruvbox-dark --style=numbers,changes --color=always "$file" || cat "$1";;
  esac
fi

file -Lb -- "$1" | fold -s -w "$width"

exit 0
