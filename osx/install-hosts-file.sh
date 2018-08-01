#!/usr/bin/env bash
# Copies a hosts file from the interwebs which blocks lots of garbage.
# Installs it into /etc/hosts if it's not already installed.

set -e

PROGNAME="$0"
DOWNLOAD_URL="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts"

main() {
  local tmpfile=$(mktemp)
  log "Downloading hosts file..."
  curl -sSf "$DOWNLOAD_URL" > "$tmpfile"

  if assert_files_are_the_same "$tmpfile" "/etc/hosts"; then
    log "Current hosts file is up-to-date."
  else
    log "Current hosts file is outdated."
    local backup="/etc/hosts.bak.$(date -u +%s)"
    sudo cp /etc/hosts "$backup"
    sudo cp "$tmpfile" /etc/hosts
    echo "$0 ==> New hosts file installed. Backup of old made at '$backup'."
  fi
}

log() {
  echo "$PROGNAME ==> $@"
}

assert_files_are_the_same() {
  set +e
  unique_files_count=$(shasum -a 256 "$@" | awk '{print $1}' | sort -n | uniq | wc -l)
  if ! [ $? -eq 0 ]; then
    log "Whoops! Couldn't get the shasum of $@."
    exit 1
  fi
  set -e

  if [ "$unique_files_count" -eq 1 ]; then
    return 0 # true
  else
    return 1 # false
  fi
}

main "$@"
