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

# Compile and run all official test cases present, then copy to home
solve: $(TARGET)
	@echo "Solving Level $(L)..."
	@for f in $(DIR)/in_level-$(L)_*.txt; do \
		[ -f "$$f" ] || continue; \
		base=$$(basename "$$f"); \
		if [ "$$base" != "in_level-$(L)_0-example.txt" ]; then \
			out="$(DIR)/out_$${base#in_}"; \
			echo "Running $$f -> $$out"; \
			./$(TARGET) < "$$f" > "$$out"; \
		fi; \
	done
	cp $(DIR)/out_level-$(L)_*.txt ~/
	@echo "Copied outputs to ~/"

clean:
	rm -f $(TARGET)
