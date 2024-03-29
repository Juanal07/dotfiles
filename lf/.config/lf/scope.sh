#!/bin/bash

set -C -f -u
#IFS=$'\n'
IFS="$(printf '%b_' '\n')";
IFS="${IFS%_}"

# ANSI color codes are supported.
# STDIN is disabled, so interactive scripts won't work properly

# This script is considered a configuration file and must be updated manually.

# Meanings of exit codes:
# code | meaning    | action of ranger
# -----+------------+-------------------------------------------
# 0    | success    | Display stdout as preview
# 1    | no preview | Display no preview at all
# 2    | plain text | Display the plain content of the file

# Script arguments
FILE_PATH="${1}"         # Full path of the highlighted file
HEIGHT="${2}"

#FILE_EXTENSION="${FILE_PATH##*.}"
#FILE_EXTENSION_LOWER=$(echo ${FILE_EXTENSION} | tr '[:upper:]' '[:lower:]')

# Settings
HIGHLIGHT_SIZE_MAX=262143  # 256KiB
HIGHLIGHT_TABWIDTH=8

image() {
	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
		printf '{"action": "add", "identifier": "PREVIEW", "x": "%s", "y": "%s", "width": "%s", "height": "%s", "scaler": "contain", "path": "%s"}\n' "$4" "$5" "$(($2-1))" "$(($3-1))" "$1" > "$FIFO_UEBERZUG"
		exit 1
	else
		chafa "$1" -s "$4x"
	fi
}

handle_mime() {
  local mimetype="${1}"
  case "${mimetype}" in
    text/html) w3m -dump "${FILE_PATH}" ;;
    text/troff) man ./ "${FILE_PATH}" | col -b ;;
    text/* | */xml) bat --theme=gruvbox-dark --style=numbers,changes --color=always "${FILE_PATH}";;
    *.json) bat --theme=gruvbox-dark --style=numbers,changes --color=always "${FILE_PATH}";;
    application/zip) atool --list -- "${FILE_PATH}" ;;
    # image/*) chafa --fill=block --symbols=block -c 256 -s 80x"${HEIGHT}" "${FILE_PATH}" || exit 1;;
    image/*) image "$1" "$2" "$3" "$4" "$5" ;;
    video/* | audio/* | application/octet-stream) mediainfo "${FILE_PATH}" || exit 1;;
    */pdf) pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" - ;;
    *opendocument*) odt2txt "${FILE_PATH}" ;;
  esac
}

MIMETYPE="$( file --dereference --brief --mime-type -- "${FILE_PATH}" )"
handle_mime "${MIMETYPE}"
exit 1
