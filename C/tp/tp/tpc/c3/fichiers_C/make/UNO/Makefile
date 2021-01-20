# Indiquer quel compilateur est à utiliser
	CC      = gcc
	
# Spécifier les options du compilateur
	CFLAGS = -Wextra -pedantic
	LDFLAGS =
	STDFLAGS  = -std=c99

# All: Ensemble des programme principaux
all: test_UNO jouer_UNO
	#All

## test_UNO
test_UNO: test_UNO.c uno.o carte.o main.o jeu.o
	#test_UNO
	$(CC) $(STDFLAGS) $(LDFLAGS) $^ -o $@

## jouer_UNO
jouer_UNO: jouer_UNO.c uno.o carte.o main.o jeu.o
	#jouer_UNO
	$(CC) $(STDFLAGS) $(LDFLAGS) $^ -o $@

## Clean
clean:
	#clean
	/bin/rm -f *.o test_UNO jouer_UNO

depend: 
	makedepend *.c -Y.