#!/usr/bin/env bash
# shellcheck disable=SC2059

#
# edits by parkr:
# 1. instead of pulling from the web, pull from the local copy stored a
#    directory away

main() {
  set -eu
  if [ -n "${DEBUG:-}" ]; then set -x; fi

  need_cmd plutil

  local plist="com.googlecode.iterm2.plist"
  local repo_prefs="$(dirname "$0")/../com.googlecode.iterm2.plist"
  local new_plist="/tmp/${plist}-$$"
  local installed_plist="$HOME/Library/Preferences/$plist"

  check_if_update_needed "$repo_prefs" "$installed_plist"

  check_for_iterm

  header "Copying plist from $repo_prefs"
  if cat "$repo_prefs" | plutil -convert binary1 -o "$new_plist" -; then
    cp -f "$new_plist" "$installed_plist"
    rm -f "$new_plist"
    info "iTerm preferences installed or updated in $installed_plist."
  else
    warn "A failure occured when downloading or converting from XML."
    warn "Your current preferences have not been changed."
    exit_with "Installation failed" 5
  fi
}

check_for_iterm() {
  need_cmd pgrep

  if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
    warn "You appear to be running this script from within iTerm.app which"
    warn "could overwrite your new preferences on quit."
    warn "Please quit iTerm and run this from Terminal.app or an SSH session."
    exit_with "Cannot run program using iTerm.app" 3
  fi

  if pgrep -q iTerm2; then
    warn "You appear to have iTerm.app currently running. Please quit the"
    warn "application so your updates won't get overridden on quit."
    exit_with "iTerm.app cannot be running" 4
  fi
}

check_if_update_needed() {
  header "Checking if update is necessary..."

  need_cmd plutil
  need_cmd xmllint

  local repo_prefs="$1"
  local installed_plist="$2"
  local installed_prefs="/tmp/iterm2-installed-prefs.$$.xml"

  if [ -f "$installed_plist" ]; then
    if plutil -convert xml1 -o - "$installed_plist" \
      | xmllint --format - > "$installed_prefs"; then
      if diff "$repo_prefs" "$installed_prefs" > /dev/null 2>&1; then
        exit_with "Installed settings match." 0
      else
        warn "Installed settings do not match."
      fi
    else
      warn "Could not check $installed_plist."
    fi
  fi
}

exit_with() {
  case "${TERM:-}" in
    *term | xterm-* | rxvt | screen | screen-*)
      printf -- "\n\033[1;31mERROR: \033[1;37m${1:-}\033[0m\n\n" >&2
      ;;
    *)
      printf -- "\nERROR: ${1:-}\n\n" >&2
      ;;
  esac
  exit "${2:-10}"
}

header() {
  case "${TERM:-}" in
    *term | xterm-* | rxvt | screen | screen-*)
      printf -- "\033[1;36m-----> \033[1;37m\033[40m${*}\033[0m\n"
      ;;
    *)
      printf -- "-----> $*\n"
      ;;
  esac
}

info() {
  case "${TERM:-}" in
    *term | xterm-* | rxvt | screen | screen-*)
      printf -- "       \033[1;37m\033[40m${*:-}\033[0m\n"
      ;;
    *)
      printf -- "       ${*:-}\n"
      ;;
  esac
}

need_cmd() {
  if ! command -v "$1" > /dev/null 2>&1; then
    exit_with "Required command '$1' not found on PATH" 127
  fi
}

warn() {
  case "${TERM:-}" in
    *term | xterm-* | rxvt | screen | screen-*)
      printf -- "\033[1;31m !!!   \033[1;37m\033[40m${*:-}\033[0m\n" >&2
      ;;
    *)
      printf -- " !!!   ${*:-}\n" >&2
      ;;
  esac
}

# Only invoke `main()` if this file is the running program
case "$0" in
bash|sh|$BASH_SOURCE)
  main "$@" || exit 99
  ;;
esac
