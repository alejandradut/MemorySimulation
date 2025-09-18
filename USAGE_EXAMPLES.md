# Usage Examples and Sample Outputs

## Quick Start

### Basic Compilation and Run
```bash
# Using Makefile (recommended)
make
make run

# Or compile manually
gcc MemorySimulation/main.c -o memory_simulation -Wall
./memory_simulation
```

### Running with Different Test Cases
```bash
# Large memory scenario
make run-large

# Small memory scenario  
make run-small

# Custom input file
./memory_simulation my_custom_input.txt
```

## Sample Session Output

### Phase 1: Initial Allocation
```
===== STATIC MEMORY ALLOCATION SIMULATION =====

Input file: input.txt
Memory size: 1000 KB
Number of processes: 7

-------------------------------------------------
Processes Loaded:
ProcessID  Size (KB) 
-------------------------------------------------
1          300       
2          250       
3          150       
4          120       
5          80        
6          60        
7          40        

=== First-Fit Strategy Simulation ===

--- Phase 1: Initial Process Allocation ---
How many processes do you want to allocate initially? (max 7): 3
P1 P2 P3 

Memory Summary: Used: 700 KB (70.0%), Free: 300 KB (30.0%)
Blocks: Total: 2, Free: 1
Processes: Running: 3, Terminated: 0, Unallocated: 4
```

### Phase 2: Process Termination
```
--- Phase 2: Process Termination ---
Running processes: P1 P2 P3 
Enter number of processes to terminate ([0] for none, [-1] for all, [1-3] for specific processes): 1
Enter process ID to terminate: 2

Coalescing Process: Checking for adjacent free blocks after P2 termination
  No adjacent free blocks found for coalescing
Terminated P2

Memory Summary: Used: 450 KB (45.0%), Free: 550 KB (55.0%)
Blocks: Total: 3, Free: 2
Processes: Running: 2, Terminated: 1, Unallocated: 4
```

### Phase 3: Additional Allocation
```
--- Phase 3: Additional Process Allocation ---
Remaining unallocated processes: P4 P5 P6 P7 
How many more processes do you want to allocate ([0] for none, [1-4] for specific processes): 2
P4 P5 

Memory Summary: Used: 650 KB (65.0%), Free: 350 KB (35.0%)
Blocks: Total: 4, Free: 2
Processes: Running: 4, Terminated: 1, Unallocated: 2
```

### Phase 4: Large Process Test
```
--- Phase 4: Large Process Allocation ---
Enter size for a large process (P9999) allocation (as % of available free memory, 1–100): 80
Attempting large allocation (P9999, 280KB - 80.00% of available free memory): FAILED (not enough contiguous space)

Memory Summary: Used: 650 KB (65.0%), Free: 350 KB (35.0%)
Blocks: Total: 4, Free: 2
Processes: Running: 4, Terminated: 1, Unallocated: 2
```

### Final Results Summary
```
=== Summary of Allocation Methods ===
Strategy   Success Rate    Fragmentation   Block Count
----------------------------------------------------------
First Fit  85.7%           23.5%           6          
Best Fit   71.4%           18.2%           8          
Worst Fit  78.6%           31.7%           5          
```

## Input File Formats

### Standard Format
```
1000        # Total memory size in KB
1    300    # Process ID, Size in KB
2    250    # Process ID, Size in KB
3    150    # Process ID, Size in KB
```

### Extended Format (with timing - not used in current version)
```
1000        # Total memory size
1    300    0    10    # ID, Size, Arrival, Duration
2    250    2    15    # ID, Size, Arrival, Duration
```

## Common Use Cases

### Testing Fragmentation
1. Allocate several processes
2. Terminate every other process
3. Try to allocate a large process
4. Compare success across algorithms

### Memory Pressure Testing
1. Use small memory size (e.g., 500KB)
2. Try to allocate processes totaling > 100% memory
3. Observe allocation failures

### Coalescing Demonstration  
1. Allocate adjacent processes
2. Terminate them in sequence
3. Watch automatic coalescing combine free blocks

## Performance Comparison Examples

### Scenario 1: Sequential Allocation
**Input:** 1000KB memory, processes: 300, 250, 150, 120, 80

| Algorithm | Success Rate | Fragmentation | Comments |
|-----------|--------------|---------------|----------|
| First Fit | 100% | 15% | Fast, some waste |
| Best Fit | 100% | 12% | Better utilization |
| Worst Fit | 80% | 25% | Poor large block handling |

### Scenario 2: Memory Pressure
**Input:** 500KB memory, processes: 200, 150, 100, 80, 60

| Algorithm | Success Rate | Fragmentation | Comments |
|-----------|--------------|---------------|----------|
| First Fit | 60% | 30% | Quick failures |
| Best Fit | 80% | 18% | Better packing |
| Worst Fit | 40% | 45% | Worst performance |

## Interactive Commands Summary

During simulation phases, you can use:
- **Numbers (1-N)**: Specify how many processes to allocate/terminate
- **Process IDs**: When terminating, specify which processes
- **0**: Skip a phase
- **-1**: Terminate all processes (Phase 2 only)
- **Percentages (1-100)**: Large process size in Phase 4

## Troubleshooting

### Common Issues

**Input file not found:**
```bash
Error: Could not open input file 'input.txt'
```
*Solution:* Ensure input file exists and is readable

**Invalid input format:**
```bash
Warning: Line 3 in input file has invalid format, skipping
```
*Solution:* Check input file format, ensure numeric values

**Compilation errors:**
```bash
gcc: error: MemorySimulation/main.c: No such file
```
*Solution:* Run from correct directory or adjust path
