# Memory Allocation Simulation

A comprehensive C program that demonstrates and compares different contiguous static memory allocation algorithms used in operating systems.

## 🎯 Overview

This simulation implements three classic memory allocation strategies:
- **First Fit** - Allocates the first available block that fits
- **Best Fit** - Allocates the smallest available block that fits (minimizes waste)
- **Worst Fit** - Allocates the largest available block that fits (leaves biggest remainder)

## ✨ Features

- Interactive simulation with 4 phases of memory allocation
- Real-time memory visualization and statistics
- Automatic memory coalescing when processes terminate
- Comprehensive fragmentation analysis
- Comparative performance metrics across all three algorithms
- Customizable input via configuration files

## 🏗️ Architecture

### Core Components
- **Memory Manager** - Handles block allocation and deallocation
- **Process Management** - Tracks process states and memory assignments  
- **Statistics Engine** - Collects utilization and fragmentation metrics
- **Coalescing System** - Automatically merges adjacent free blocks

### Allocation Algorithms
1. **First Fit**: O(n) - Fast but can cause fragmentation
2. **Best Fit**: O(n) - Minimizes waste but slower
3. **Worst Fit**: O(n) - Leaves largest fragments

## 🚀 Getting Started

### Prerequisites
- GCC compiler
- Standard C libraries

### Compilation
```bash
gcc main.c -o memory_simulation -Wall
```

### Usage
```bash
# Run with default input file
./memory_simulation

# Run with custom input file
./memory_simulation custom_input.txt
```

### Input Format
```
[MEMORY_SIZE_KB]
[PROCESS_ID] [SIZE_KB]
[PROCESS_ID] [SIZE_KB]
...
```

### Example Input
```
1000
1    300
2    250  
3    150
4    120
5    80
6    60
7    40
```

## 📊 Simulation Phases

### Phase 1: Initial Process Allocation
- Choose how many processes to allocate initially
- Observe memory layout and utilization

### Phase 2: Process Termination  
- Terminate selected processes
- Watch automatic coalescing in action

### Phase 3: Additional Process Allocation
- Try to allocate remaining processes
- See how fragmentation affects success rates

### Phase 4: Large Process Test
- Attempt to allocate a large process (% of free memory)
- Test algorithm effectiveness under memory pressure

## 📈 Performance Metrics

The simulation tracks:
- **Success Rate** - Percentage of successful allocations
- **Memory Utilization** - Peak and average memory usage
- **Fragmentation** - External fragmentation percentage
- **Block Count** - Number of memory blocks created

## 🎓 Educational Applications

Perfect for learning:
- Operating system memory management concepts
- Algorithm comparison and analysis
- Memory fragmentation and coalescing
- System performance optimization

## 📁 Project Structure

```
MemorySimulation/
├── main.c              # Main simulation program
├── input.txt           # Sample input configuration
├── README.md           # Project documentation
└── examples/           # Additional test cases
```

## 🤝 Contributing

This is an educational project. Feel free to:
- Add new allocation algorithms
- Improve visualization features
- Create additional test cases
- Enhance performance metrics

## 📝 License

This project is for educational purposes. Please respect your institution's academic integrity policies if using for coursework.

## 🔗 References

- Operating System Concepts (Silberschatz, Galvin, Gagne)
- Memory allocation algorithms in operating systems
- Dynamic memory management techniques
