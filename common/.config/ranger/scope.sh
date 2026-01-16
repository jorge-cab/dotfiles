#!/usr/bin/env bash

FILE_PATH="${1}"
PV_WIDTH="${2}"

# Try bat first (best syntax highlighting)
if command -v bat > /dev/null; then
    bat --color=always --style=plain --terminal-width="${PV_WIDTH}" "${FILE_PATH}" && exit 5
fi

# Fallback to cat
cat "${FILE_PATH}" && exit 5
