PREFIX?=/usr/local
INC=-I$(PREFIX)/include
LIB=-L$(PREFIX)/lib
CFLAGS=-Wall -Wextra -g -O2 -pipe -funroll-loops -ffast-math -fno-strict-aliasing
CC?=cc
AR?=ar
RANLIB?=ranlib

LIBPIDUTIL = libpidutil.a
OBJS = pidutil.o

all: $(LIBPIDUTIL) $(PROGS)

$(LIBPIDUTIL) : $(OBJS)
	$(AR) rv $(LIBPIDUTIL) $?
	$(RANLIB) $(LIBPIDUTIL)

clean:
	rm -f *.o *.a a.out core temp.* $(LIBPIDUTIL)
	rm -fr *.dSYM
