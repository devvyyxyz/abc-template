#!/usr/bin/env bash
# make-datapack.sh
# Safely convert this repo into a datapack-only layout by moving or deleting `assets/`.

set -euo pipefail

usage() {
  cat <<EOF
Usage: $0 [--backup] [--delete] [--help]

Options:
  --backup   Move `assets/` to a timestamped backup directory (default behavior).
  --delete   Permanently delete `assets/` without backup.
  --help     Show this message.
EOF
}

DELETE=false
BACKUP=true

while [[ $# -gt 0 ]]; do
  case "$1" in
    --delete) DELETE=true; BACKUP=false; shift;;
    --backup) BACKUP=true; DELETE=false; shift;;
    --help) usage; exit 0;;
    *) echo "Unknown option: $1"; usage; exit 2;;
  esac
done

if [[ ! -d "assets" ]]; then
  echo "No 'assets' directory found; nothing to do.";
  exit 0
fi

if $DELETE; then
  echo "Deleting 'assets'...";
  rm -rf assets
  echo "assets deleted.";
  exit 0
fi

if $BACKUP; then
  ts=$(date +%Y%m%d-%H%M%S)
  dest="assets.backup.$ts"
  echo "Moving 'assets' -> '$dest'..."
  mv assets "$dest"
  echo "Moved to $dest"
fi

echo "Datapack-only conversion complete. Verify the repo and run 'chmod +x' if needed."
