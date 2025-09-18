# Memory Allocation Simulation Makefile

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -g
TARGET = memory_simulation
SOURCE = MemorySimulation/main.c

# Default target
all: $(TARGET)

# Compile the program
$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCE)

# Run the program with default input
run: $(TARGET)
	./$(TARGET)

# Run with custom input file
run-large: $(TARGET)
	./$(TARGET) examples/large_memory_test.txt

run-small: $(TARGET)
	./$(TARGET) examples/small_memory_test.txt

# Clean up compiled files
clean:
	rm -f $(TARGET)
	rm -f *.o
	rm -f *.out

# Install dependencies (if needed)
install:
	@echo "No external dependencies required for this project"

# Help target
help:
	@echo "Available targets:"
	@echo "  all         - Build the program"
	@echo "  run         - Build and run with default input"
	@echo "  run-large   - Build and run with large memory test"
	@echo "  run-small   - Build and run with small memory test"
	@echo "  clean       - Remove compiled files"
	@echo "  help        - Show this help message"

# Phony targets
.PHONY: all run run-large run-small clean install help
