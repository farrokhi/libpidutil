CC?=cc
PREFIX?=/usr/local
CPPFLAGS=-I$(PREFIX)/include
LDFLAGS=-L$(PREFIX)/lib
CFLAGS=-Wall -Wextra -g -O2 -pipe -funroll-loops -ffast-math -fno-strict-aliasing
CFLAGS+=$(CPPFLAGS)
RANLIB?=ranlib

LIBPIDUTIL = libpidutil.a
HEADERS = pidutil.h
OBJS = pidutil.o

all: $(LIBPIDUTIL)

$(LIBPIDUTIL) : $(OBJS)
	$(AR) rv $(LIBPIDUTIL) $?
	$(RANLIB) $(LIBPIDUTIL)

install: all
	install -C $(LIBPIDUTIL) $(PREFIX)/lib
	install -C $(HEADERS) $(PREFIX)/include

clean:
	rm -f *.o *.a a.out core temp.* $(LIBPIDUTIL)
	rm -fr *.dSYM
