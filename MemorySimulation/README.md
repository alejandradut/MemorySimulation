# Memory Allocation Simulation

This C program demonstrates and compares three different **contiguous static memory allocation strategies**: First Fit, Best Fit, and Worst Fit.

## Overview

The simulation helps understand how different memory allocation algorithms perform in terms of:
- **Success rates** for memory allocation
- **Memory fragmentation** patterns
- **Memory utilization** efficiency
- **External fragmentation** characteristics

## Allocation Strategies

### 1. First Fit
- Scans memory blocks from the beginning
- Allocates the **first available block** that fits the process
- Fast allocation but can lead to fragmentation at the beginning of memory

### 2. Best Fit
- Searches for the **smallest block** that fits the process
- Minimizes wasted space per allocation
- Can lead to many small unusable fragments

### 3. Worst Fit
- Allocates the **largest available block** that fits the process
- Leaves the largest possible remaining space
- Reduces the number of tiny fragments

## Input Format

The program reads from an input file (default: `input.txt`):

```
1000        # Total memory size in KB
1    300    # Process ID and size in KB
2    250    # Process ID and size in KB
3    150    # ... and so on
4    120
5    80
6    60
7    40
```

## Building and Running

### Using the Makefile

```bash
# Build the program
make

# Build and run with default input
make run

# Clean build files
make clean

# Build debug version
make debug

# Create a sample input file
make sample-input

# Show all available commands
make help
```

### Manual Compilation

```bash
gcc -Wall -Wextra -std=c99 -g -o memory_sim main.c
./memory_sim input.txt
```

## Simulation Phases

The program runs through **4 interactive phases** for each allocation strategy:

### Phase 1: Initial Process Allocation
- Choose how many processes to allocate initially
- Processes are allocated based on the selected strategy

### Phase 2: Process Termination
- Select running processes to terminate
- Demonstrates **memory coalescing** (merging adjacent free blocks)

### Phase 3: Additional Process Allocation
- Try to allocate remaining unallocated processes
- Shows how fragmentation affects later allocations

### Phase 4: Large Process Allocation Test
- Attempts to allocate a large process (specified as % of free memory)
- Tests the effectiveness of each strategy for large allocations

## Key Features

- **Memory Block Management**: Dynamic splitting and coalescing of memory blocks
- **Process Lifecycle**: NEW → RUNNING → TERMINATED state tracking
- **Fragmentation Analysis**: Detailed metrics on external fragmentation
- **Visual Memory State**: Simplified and detailed memory state displays
- **Comparative Statistics**: Success rates, utilization, and fragmentation comparison

## Example Output

```
=== First-Fit Strategy Simulation ===
Memory Summary: Used: 700 KB (70.0%), Free: 300 KB (30.0%)
Blocks: Total: 4, Free: 2
Processes: Running: 5, Terminated: 0, Unallocated: 2

=== Summary of Allocation Methods ===
Strategy   Success Rate    Fragmentation   Block Count   
----------------------------------------------------------
First Fit  85.7%          23.1%           6             
Best Fit   85.7%          18.5%           7             
Worst Fit  85.7%          31.2%           5             
```

## Files

- `main.c` - Main program source code
- `input.txt` - Default input file with process specifications
- `Makefile` - Build configuration and convenience commands
- `README.md` - This documentation

## Educational Purpose

This simulation is designed to help understand:
- How different allocation strategies behave under various conditions
- The trade-offs between allocation speed and memory utilization
- How memory fragmentation develops over time
- The importance of memory coalescing in memory management

## Requirements

- **C Compiler**: GCC or compatible
- **Standard**: C99 or later
- **Platform**: Unix-like systems (Linux, macOS) or Windows with appropriate compiler

---

*This project demonstrates fundamental concepts in operating systems and memory management.*
