# Memory Allocation Simulation Makefile
# Author: Generated for MemorySimulation project

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -g
TARGET = memory_sim
SOURCE = main.c
INPUT_FILE = input.txt

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(SOURCE)
	@echo "Compiling memory allocation simulation..."
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCE)
	@echo "Build successful! Executable: $(TARGET)"

# Run the simulation with default input
run: $(TARGET)
	@echo "Running memory allocation simulation..."
	@echo "----------------------------------------"
	./$(TARGET) $(INPUT_FILE)

# Run with custom input file
run-input: $(TARGET)
	@read -p "Enter input file path: " file; \
	./$(TARGET) "$$file"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -f $(TARGET)
	@echo "Clean complete."

# Debug build with extra debugging symbols
debug: CFLAGS += -DDEBUG -O0
debug: $(TARGET)
	@echo "Debug build complete."

# Release build with optimizations
release: CFLAGS += -O2 -DNDEBUG
release: clean $(TARGET)
	@echo "Release build complete."

# Check for memory leaks (requires valgrind)
valgrind: $(TARGET)
	@echo "Running valgrind memory check..."
	valgrind --leak-check=full --show-leak-kinds=all ./$(TARGET) $(INPUT_FILE)

# Create a sample input file
sample-input:
	@echo "Creating sample input file: sample_input.txt"
	@echo "2000" > sample_input.txt
	@echo "101 400" >> sample_input.txt
	@echo "102 350" >> sample_input.txt
	@echo "103 200" >> sample_input.txt
	@echo "104 180" >> sample_input.txt
	@echo "105 100" >> sample_input.txt
	@echo "106 80" >> sample_input.txt
	@echo "107 50" >> sample_input.txt
	@echo "108 30" >> sample_input.txt
	@echo "Sample input created with 2000KB memory and 8 processes"

# Show help
help:
	@echo "Memory Allocation Simulation Makefile"
	@echo "====================================="
	@echo "Available targets:"
	@echo "  all          - Build the program (default)"
	@echo "  run          - Build and run with default input (input.txt)"
	@echo "  run-input    - Build and run with custom input file"
	@echo "  clean        - Remove build artifacts"
	@echo "  debug        - Build with debugging symbols"
	@echo "  release      - Build optimized release version"
	@echo "  valgrind     - Run with memory leak detection"
	@echo "  sample-input - Create a sample input file"
	@echo "  help         - Show this help message"
	@echo ""
	@echo "Usage examples:"
	@echo "  make            # Build the program"
	@echo "  make run        # Build and run simulation"
	@echo "  make clean      # Clean build files"
	@echo "  make debug      # Build debug version"

# Phony targets
.PHONY: all run run-input clean debug release valgrind sample-input help
