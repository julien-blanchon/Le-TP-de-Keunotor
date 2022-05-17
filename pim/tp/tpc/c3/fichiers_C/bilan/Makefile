# Définition des Variables (à compléter)
CC = gcc -std=c99
CFLAGS = -Wextra -pedantic
LDFLAGS = 
EXE = 

# Règles (à compléter avec des variables automatiques)
all: exemple_file test_file

test_file: test_file.c file.o
	$(CC) $(LDFLAGS) $^ -o $@

exemple_file: exemple_file.c file.o
	$(CC) $(LDFLAGS) $^ -o $@

depend: makedepend

makedepend:
	makedepend *.c -Y.

clean:
	/bin/rm -f *.o test_file exemple_file

.PHONY: clean all makedepend

