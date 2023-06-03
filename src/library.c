#include <stdio.h>
#include <stdlib.h>

extern int read_int(int n) {
	char buffer[n];
	fgets(buffer, n, stdin);

	return atoi(buffer);	
}
