top := top
sim := $(shell find src/ -type f -name "*.cpp")

target := sim

bin/$(target): src/*.v src/*.cpp
	verilator +1364-2005ext+ -o $(target) src/$(top).v --Mdir bin/ --cc $(sim) --exe --build -LDFLAGS "-latomic -lraylib"
	@echo # new line for readability

.PHONY: run
run: bin/$(target)
	@bin/$(target)

.PHONY: clean
clean:
	rm -r bin/
