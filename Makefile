# Top-Level Makefile for Hack Computer Project
# Find all subdirectories containing Makefiles
SUBDIRS := $(dir $(shell find rtl -name Makefile))

# Colors for output
GREEN  := \033[0;32m
RED    := \033[0;31m
YELLOW := \033[0;33m
NC     := \033[0m

# Default target: run all simulations
.PHONY: all
all: sim

# Run all testbenches
.PHONY: sim
sim:
	@echo "$(YELLOW)========================================$(NC)"
	@echo "$(YELLOW)Running all testbenches$(NC)"
	@echo "$(YELLOW)========================================$(NC)"
	@failed=0; \
	for dir in $(SUBDIRS); do \
		echo ""; \
		echo "$(YELLOW)>>> $$dir$(NC)"; \
		$(MAKE) -C $$dir sim || failed=1; \
	done; \
	echo ""; \
	echo "$(YELLOW)========================================$(NC)"; \
	if [ $$failed -eq 0 ]; then \
		echo "$(GREEN)All tests passed!$(NC)"; \
	else \
		echo "$(RED)Some tests failed!$(NC)"; \
		exit 1; \
	fi

# Clean all generated files
.PHONY: clean
clean:
	@echo "Cleaning all subdirectories..."
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done
	@echo "Done."

# Run Verilator linting on all RTL files
.PHONY: lint
lint:
	@echo "$(YELLOW)========================================$(NC)"
	@echo "$(YELLOW)Running Verilator linting$(NC)"
	@echo "$(YELLOW)========================================$(NC)"
	@failed=0; \
	for dir in $(SUBDIRS); do \
		echo ""; \
		echo "$(YELLOW)>>> $$dir$(NC)"; \
		$(MAKE) -C $$dir lint || failed=1; \
	done; \
	echo ""; \
	echo "$(YELLOW)========================================$(NC)"; \
	if [ $$failed -eq 0 ]; then \
		echo "$(GREEN)All linting checks passed!$(NC)"; \
	else \
		echo "$(RED)Some linting checks failed!$(NC)"; \
		exit 1; \
	fi

# List all modules
.PHONY: list
list:
	@echo "Available modules:"
	@for dir in $(SUBDIRS); do \
		echo "  - $$dir"; \
	done

# Help
.PHONY: help
help:
	@echo "Hack Computer - Build Targets"
	@echo ""
	@echo "  make          - Run all testbenches"
	@echo "  make sim      - Run all testbenches"
	@echo "  make lint     - Run Verilator linting on all RTL files"
	@echo "  make clean    - Remove generated files"
	@echo "  make list     - List all modules"
	@echo "  make help     - Show this help"
	@echo ""
	@echo "To run a specific module:"
	@echo "  cd rtl/nand_gate && make"
