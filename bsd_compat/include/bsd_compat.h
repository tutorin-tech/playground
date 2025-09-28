#include <sys/types.h>

#define __dead __attribute__((__noreturn__))

const char *getprogname(void);

extern int optreset;

void *setmode(const char *);

mode_t getmode(const void *bbox, mode_t omode);