CXX = g++
CXXFLAGS = -O3 -Wall -Wextra -std=c++20 -march=native

SRC = main.cpp
TARGET = solver

# Level selector (defaults to 1, override with `make solve L=2`)
L ?= 1
DIR = level$(L)

.PHONY: all clean example solve

all: $(TARGET)

$(TARGET):$(SRC)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRC)

# Compile and run ONLY the 0-example file, then copy to home
example: $(TARGET)
	@echo "Running Level $(L) Example..."
	./$(TARGET) < $(DIR)/in_level-$(L)_0-example.txt > $(DIR)/out_level-$(L)_0-example.txt
	cp $(DIR)/out_level-$(L)_0-example.txt ~/
	@echo "Copied example output to ~/"

# Compile and run the 5 official test cases explicitly, then copy to home
solve: $(TARGET)
	@echo "Solving Level $(L) (Test cases 1 to 5)..."
	./$(TARGET) < $(DIR)/in_level-$(L)_1-small.txt > $(DIR)/out_level-$(L)_1-small.txt
	./$(TARGET) < $(DIR)/in_level-$(L)_2-small.txt > $(DIR)/out_level-$(L)_2-small.txt
	./$(TARGET) < $(DIR)/in_level-$(L)_3-medium.txt > $(DIR)/out_level-$(L)_3-medium.txt
	./$(TARGET) < $(DIR)/in_level-$(L)_4-medium.txt > $(DIR)/out_level-$(L)_4-medium.txt
	./$(TARGET) < $(DIR)/in_level-$(L)_5-large.txt > $(DIR)/out_level-$(L)_5-large.txt
	cp $(DIR)/out_level-$(L)_*.txt ~/
	@echo "Copied all 5 outputs to ~/"

clean:
	rm -f $(TARGET)
