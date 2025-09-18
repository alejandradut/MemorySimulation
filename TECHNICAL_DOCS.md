# Technical Documentation

## Algorithm Implementation Details

### Memory Management Architecture

The simulation uses a block-based memory management system where memory is divided into contiguous blocks. Each block contains:

```c
typedef struct {
    int start_address; // Starting address of the block
    int size;          // Size of the block in KB
    bool is_free;      // Allocation status
    int process_id;    // ID of owning process (-1 if free)
} MemoryBlock;
```

### Allocation Algorithms

#### 1. First Fit Algorithm
**Time Complexity:** O(n)
**Space Complexity:** O(1)

```c
int find_first_fit(MemoryManager *manager, int size) {
    for (int i = 0; i < manager->block_count; i++) {
        if (manager->blocks[i].is_free && manager->blocks[i].size >= size) {
            return i;
        }
    }
    return -1;
}
```

**Advantages:**
- Fast allocation
- Simple implementation
- Low CPU overhead

**Disadvantages:**
- Can cause fragmentation at the beginning of memory
- May waste space in small fragments

#### 2. Best Fit Algorithm
**Time Complexity:** O(n)
**Space Complexity:** O(1)

```c
int find_best_fit(MemoryManager *manager, int size) {
    int best_index = -1;
    int smallest_diff = INT_MAX;
    
    for (int i = 0; i < manager->block_count; i++) {
        if (manager->blocks[i].is_free && manager->blocks[i].size >= size) {
            int diff = manager->blocks[i].size - size;
            if (diff < smallest_diff) {
                smallest_diff = diff;
                best_index = i;
            }
        }
    }
    return best_index;
}
```

**Advantages:**
- Minimizes wasted space
- Good memory utilization
- Reduces internal fragmentation

**Disadvantages:**
- Creates many small fragments
- Higher external fragmentation
- Slower than First Fit

#### 3. Worst Fit Algorithm
**Time Complexity:** O(n)
**Space Complexity:** O(1)

```c
int find_worst_fit(MemoryManager *manager, int size) {
    int worst_index = -1;
    int largest_diff = -1;
    
    for (int i = 0; i < manager->block_count; i++) {
        if (manager->blocks[i].is_free && manager->blocks[i].size >= size) {
            int diff = manager->blocks[i].size - size;
            if (diff > largest_diff) {
                largest_diff = diff;
                worst_index = i;
            }
        }
    }
    return worst_index;
}
```

**Advantages:**
- Leaves large fragments for future allocations
- Can handle large requests better
- Reduces search time for large blocks

**Disadvantages:**
- Generally poor memory utilization
- Fastest to create unusable fragments
- Often performs worst in practice

### Memory Coalescing

The coalescing algorithm merges adjacent free blocks to reduce external fragmentation:

```c
bool coalesce_memory(MemoryManager *manager, Process processes[]) {
    bool merged = false;
    for (int i = 0; i < manager->block_count - 1; ) {
        if (manager->blocks[i].is_free && manager->blocks[i + 1].is_free) {
            // Merge blocks
            manager->blocks[i].size += manager->blocks[i + 1].size;
            
            // Shift remaining blocks
            for (int j = i + 1; j < manager->block_count - 1; j++) {
                manager->blocks[j] = manager->blocks[j + 1];
            }
            
            manager->block_count--;
            merged = true;
        } else {
            i++;
        }
    }
    return merged;
}
```

### Block Splitting

When a block is larger than needed, it's split into two blocks:
1. **Allocated block** - Exact size requested
2. **Free block** - Remaining space (if ≥ 10KB threshold)

This prevents excessive fragmentation from very small leftover blocks.

### Performance Metrics

#### Success Rate
```
Success Rate = (Successful Allocations / Total Attempts) × 100%
```

#### Memory Utilization
```
Utilization = (Total Memory - Free Memory) / Total Memory × 100%
```

#### External Fragmentation
```
Fragmentation = (Free Memory - Largest Free Block) / Free Memory × 100%
```

### Data Structures

#### Memory Manager
```c
typedef struct {
    int total_size;                 // Total memory size
    int free_size;                  // Available free memory  
    int block_count;                // Number of blocks
    MemoryBlock blocks[MAX_BLOCKS]; // Block array
    AllocationStrategy strategy;    // Current strategy
} MemoryManager;
```

#### Process Control Block
```c
typedef struct {
    int id;             // Process ID
    int size;           // Memory requirement
    ProcessState state; // Current state
    int block_index;    // Assigned block index
} Process;
```

### Implementation Notes

1. **Block Array Management**: Blocks are stored in a simple array, sorted by start address
2. **Process Tracking**: Each process maintains a reference to its allocated block
3. **Memory Validation**: All allocations are validated against available memory
4. **Interactive Simulation**: User controls allocation and deallocation timing

### Complexity Analysis

| Operation | First Fit | Best Fit | Worst Fit |
|-----------|-----------|----------|-----------|
| Allocation | O(n) | O(n) | O(n) |
| Deallocation | O(1) | O(1) | O(1) |
| Coalescing | O(n²) | O(n²) | O(n²) |

### Memory Layout Visualization

```
Initial State:
[-------- FREE (1000KB) --------]

After P1 (300KB) allocation:
[P1: 300KB][--- FREE (700KB) ---]

After P2 (250KB) allocation:
[P1: 300KB][P2: 250KB][FREE: 450KB]

After P1 deallocation + coalescing:
[-- FREE (300KB) --][P2: 250KB][FREE: 450KB]
```
