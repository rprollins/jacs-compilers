MAKEFILE := $(abspath $(lastword $(MAKEFILE_LIST)))
ROOT_DIR := $(abspath $(dir $(MAKEFILE)))
CPPFLAGS := -I$(ROOT_DIR)/include
LDFLAGS  := -L$(ROOT_DIR)/lib
FCFLAGS  := -J$(ROOT_DIR)/modules

.PHONY : all clean example_mod.mod

all : bin/example1 bin/example2 bin/example3 bin/example4

bin/example1 : build/example1.o
	$(CC) $(LDFLAGS) -o $@ $<

bin/example2 : build/example2.o
	$(FC) $(LDFLAGS) -o $@ $<

bin/example3 : build/example3.o lib/libexample.so
	$(CC) $(LDFLAGS) -o $@ $< -lexample

bin/example4 : build/example4.o build/example_mod.o
	$(FC) $(LDFLAGS) -o $@ $^

build/%.o : src/%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<

build/%.o : src/%.f95
	$(FC) $(CPPFLAGS) $(FCFLAGS) -o $@ -c $<

build/example4.o : src/example4.f95 modules/example_mod.mod
	$(FC) $(CPPFLAGS) $(FCFLAGS) -o $@ -c $<

lib/libexample.so : src/example_func.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -shared -fPIC -o $@ $<

modules/example_mod.mod : build/example_mod.o

clean :
	rm bin/* build/* lib/* modules/*
