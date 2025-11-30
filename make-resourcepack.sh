#!/usr/bin/env bash
# make-resourcepack.sh
# Safely convert this repo into a resource-pack-only layout by moving or deleting `data/`.

set -euo pipefail

usage() {
  cat <<EOF
Usage: $0 [--backup] [--delete] [--help]

Options:
  --backup   Move `data/` to a timestamped backup directory (default behavior).
  --delete   Permanently delete `data/` without backup.
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

if [[ ! -d "data" ]]; then
  echo "No 'data' directory found; nothing to do.";
  exit 0
fi

if $DELETE; then
  echo "Deleting 'data'...";
  rm -rf data
  echo "data deleted.";
  exit 0
fi

if $BACKUP; then
  ts=$(date +%Y%m%d-%H%M%S)
  dest="data.backup.$ts"
  echo "Moving 'data' -> '$dest'..."
  mv data "$dest"
  echo "Moved to $dest"
fi

echo "Resource-pack-only conversion complete. Verify the repo and run 'chmod +x' if needed."
