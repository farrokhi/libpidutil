PREFIX?=/usr/local
INC=-I$(PREFIX)/include
LIB=-L$(PREFIX)/lib
CFLAGS=-Wall -Wextra -g -O2 -pipe -funroll-loops -ffast-math -fno-strict-aliasing
CC?=cc
AR?=ar
RANLIB?=ranlib

LIBPIDUTIL = libpidutil.a
HEADERS = pidutil.h
OBJS = pidutil.o

all: $(LIBPIDUTIL)

$(LIBPIDUTIL) : $(OBJS)
	$(AR) rv $(LIBPIDUTIL) $?
	$(RANLIB) $(LIBPIDUTIL)

install:
	install -C $(LIBPIDUTIL) $(PREFIX)/lib
	install -C $(HEADERS) $(PREFIX)/include

clean:
	rm -f *.o *.a a.out core temp.* $(LIBPIDUTIL)
	rm -fr *.dSYM
