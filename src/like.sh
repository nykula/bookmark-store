#!/bin/sh

STORE=~/.bookmark-store

if test "$1" = 'init'; then
  shift
  git clone "$1" "$STORE"
  exit
fi

if test "$1" = 'pull'; then
  cd "$STORE" || exit
  git pull origin master
  exit
fi

if test "$1" = 'push'; then
  cd "$STORE" || exit
  git push origin master
  exit
fi

if test "$1" = 'rm'; then
  shift
  cd "$STORE" || exit
  if test "$(ls -l | wc -l)" -gt 1; then
    for FILE in *; do
      if test "$(cat "$FILE")" = "$1"; then
        git rm "$FILE" && git commit -m "Remove $1"
        break
      fi
    done
  fi
  exit
fi

if test -n "$1"; then
  cd "$STORE" || exit
  if test "$(ls -l | wc -l)" -eq 1 || ! grep -qFx "$1" *; then
    ID="$(date +%s)"
    echo "$1" > "$ID" && git add "$ID" && git commit -m "Insert $1"
  fi
  exit
fi

if test -z "$1"; then
  cd "$STORE" || exit
  if test "$(ls -l | wc -l)" -gt 1; then
    cat *
  fi
  exit
fi
