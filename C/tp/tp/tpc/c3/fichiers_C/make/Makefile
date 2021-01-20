# Indiquer quel compilateur est à utiliser
	CC      = gcc
	
# Spécifier les options du compilateur
	CFLAGS = -Wextra -pedantic
	LDFLAGS =
	STDFLAGS  = -std=c99

# All: Ensemble des programme principaux
all: EDT ephemeride
	#All

## Ephemeride
ephemeride: date.o ephemeride.o
	#ephemeride
	$(CC) $(STDFLAGS) $(LDFLAGS) $^ -o $@

## EDT
EDT: cours.o salle.o date.o enseignant.o EDT.o
	#EDT
	$(CC) $(STDFLAGS) $(LDFLAGS) $^ -o $@

## Clean
clean:
	#clean
	/bin/rm -f *.o ephemeride EDT

depend: 
	makedepend *.c -Y.
