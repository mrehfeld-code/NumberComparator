AS = /usr/bin/nasm
CC = /usr/bin/gcc

NASM_FMT = elf

all: NumberComparator

NumberComparator: build/main.asm.o build/library.c.o 
	$(CC) -m32 build/main.asm.o build/library.c.o -o NumberComparator

build/main.asm.o:  src/main.asm
	$(AS) src/main.asm -f $(NASM_FMT) -o build/main.asm.o
	
build/library.c.o: src/library.c
	$(CC) -m32 -c src/library.c -o build/library.c.o

cleanup:
	rm -rf build

install:
	mkdir -p /usr/local/bin
	cp NumberComparator /usr/local/bin/

uninstall:
	rm -rf /usr/local/bin/NumberComparator
