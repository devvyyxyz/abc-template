# Makefile - convenience targets for this repository

.PHONY: make-datapack make-resourcepack install-scripts test

SCRIPTS := make-datapack.sh make-resourcepack.sh

make-datapack:
	@echo "Preparing and running make-datapack.sh (will move or delete assets)..."
	chmod +x $(SCRIPTS)
	./make-datapack.sh

make-resourcepack:
	@echo "Preparing and running make-resourcepack.sh (will move or delete data)..."
	chmod +x $(SCRIPTS)
	./make-resourcepack.sh

install-scripts:
	@echo "Making helper scripts executable"
	chmod +x $(SCRIPTS)

test:
	@echo "No automated tests included. See data/abc/tests/ for manual test functions."
