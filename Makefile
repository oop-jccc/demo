# Makefile for demo .NET project
# Usage: make [target] [CONFIGURATION=Debug|Release]

# Default configuration
CONFIGURATION ?= Debug

# Project paths
PROJECT_PATH = demo/demo.csproj
SOLUTION_PATH = demo/demo.sln
OUTPUT_PATH = publish

# Colors for output
CYAN = \033[0;36m
GREEN = \033[0;32m
YELLOW = \033[0;33m
RED = \033[0;31m
NC = \033[0m # No Color

.PHONY: help restore build test clean run rebuild publish all

# Default target
all: restore build test

help:
	@echo "$(CYAN)Available targets:$(NC)"
	@echo "  $(YELLOW)restore$(NC)  - Restore NuGet packages"
	@echo "  $(YELLOW)build$(NC)    - Build the solution"
	@echo "  $(YELLOW)test$(NC)     - Run tests"
	@echo "  $(YELLOW)clean$(NC)    - Clean build artifacts"
	@echo "  $(YELLOW)run$(NC)      - Run the application"
	@echo "  $(YELLOW)rebuild$(NC)  - Clean, restore, and build"
	@echo "  $(YELLOW)publish$(NC)  - Publish the application"
	@echo "  $(YELLOW)all$(NC)      - Restore, build, and test (default)"
	@echo ""
	@echo "$(CYAN)Configuration:$(NC)"
	@echo "  Set CONFIGURATION=Release for release builds"
	@echo "  Example: make build CONFIGURATION=Release"

restore:
	@echo "$(CYAN)=== Restoring NuGet packages ===$(NC)"
	dotnet restore $(SOLUTION_PATH)

build: restore
	@echo "$(CYAN)=== Building solution ($(CONFIGURATION)) ===$(NC)"
	dotnet build $(SOLUTION_PATH) --configuration $(CONFIGURATION) --no-restore

test: build
	@echo "$(CYAN)=== Running tests ($(CONFIGURATION)) ===$(NC)"
	dotnet test $(SOLUTION_PATH) --configuration $(CONFIGURATION) --no-build --verbosity normal

clean:
	@echo "$(CYAN)=== Cleaning solution ===$(NC)"
	dotnet clean $(SOLUTION_PATH)

run: build
	@echo "$(CYAN)=== Running application ($(CONFIGURATION)) ===$(NC)"
	dotnet run --project $(PROJECT_PATH) --configuration $(CONFIGURATION)

rebuild: clean restore build
	@echo "$(GREEN)✅ Rebuild completed successfully!$(NC)"

publish: build
	@echo "$(CYAN)=== Publishing application ($(CONFIGURATION)) ===$(NC)"
	dotnet publish $(PROJECT_PATH) --configuration $(CONFIGURATION) --output $(OUTPUT_PATH)
	@echo "$(GREEN)Published to: $(OUTPUT_PATH)$(NC)"

# Check if dotnet is installed
check-dotnet:
	@which dotnet > /dev/null || (echo "$(RED)❌ .NET SDK not found. Please install .NET 8.0 SDK$(NC)" && exit 1)

# Add dependency on dotnet check for all targets that use dotnet
restore build test clean run publish: check-dotnet
