# Makefile - convenience targets for this repository


.PHONY: make-datapack make-resourcepack install-scripts test

# Controls:
# DRYRUN=1  -> don't perform destructive actions; only print what would happen
# CONFIRM=1 -> bypass interactive safety and actually run the destructive action

SCRIPTS := make-datapack.sh make-resourcepack.sh

DRYRUN ?= 0
CONFIRM ?= 0

_ensure-scripts:
	@chmod +x $(SCRIPTS) || true

make-datapack: _ensure-scripts
	@echo "Target: make-datapack"
	@if [ "$(DRYRUN)" = "1" ]; then \
		echo "DRYRUN=1 — would run: ./make-datapack.sh (assets -> backup by default)."; \
		echo "To actually run, re-run with CONFIRM=1"; \
		exit 0; \
	fi
	@if [ "$(CONFIRM)" != "1" ]; then \
		echo "This command will move or delete the 'assets' directory (safe default: move to a timestamped backup)."; \
		echo "If you are sure, run: make make-datapack CONFIRM=1"; \
		exit 0; \
	fi
	@echo "Running ./make-datapack.sh ..."
	@./make-datapack.sh

make-resourcepack: _ensure-scripts
	@echo "Target: make-resourcepack"
	@if [ "$(DRYRUN)" = "1" ]; then \
		echo "DRYRUN=1 — would run: ./make-resourcepack.sh (data -> backup by default)."; \
		echo "To actually run, re-run with CONFIRM=1"; \
		exit 0; \
	fi
	@if [ "$(CONFIRM)" != "1" ]; then \
		echo "This command will move or delete the 'data' directory (safe default: move to a timestamped backup)."; \
		echo "If you are sure, run: make make-resourcepack CONFIRM=1"; \
		exit 0; \
	fi
	@echo "Running ./make-resourcepack.sh ..."
	@./make-resourcepack.sh

install-scripts: _ensure-scripts
	@echo "Made helper scripts executable"

test:
	@echo "No automated tests included. See data/abc/tests/ for manual test functions."
