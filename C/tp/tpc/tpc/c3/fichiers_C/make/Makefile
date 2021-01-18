all: EDT

#ephemeride: date.o ephemeride.o
#	gcc -std=c99 date.o ephemeride.o -o ephemeride

#date.o: date.c date.h
#	gcc -std=c99 -Wextra -pedantic -c date.c

#ephemeride.o: ephemeride.c
#	gcc -std=c99 -Wextra -pedantic -c ephemeride.c

clean:
	rm *.o ephemeride
# DO NOT DELETE

.PHONY: clean all

EDT: cours.o salle.o date.o enseignant.o
	gcc -std=c99 cours.o salle.o date.o enseignant.o -o EDT

cours.o: cours.h salle.h date.h enseignant.h
	gcc -std=c99 -c cours.c salle.c date.c enseignant.c

date.o: date.h
	gcc -std=c99 -c date.c

enseignant.o: enseignant.h date.h
	gcc -std=c99 -c enseignant.c date.c

ephemeride.o: date.h
	gcc -std=c99 -c date.c

salle.o: salle.h date.h
	gcc -std=c99 -c salle.c date.c