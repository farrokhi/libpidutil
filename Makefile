CC?=cc
PREFIX?=/usr/local
CPPFLAGS=-I$(PREFIX)/include
LDFLAGS=-L$(PREFIX)/lib
CFLAGS=-Wall -Wextra -g -O2 -pipe -funroll-loops -ffast-math -fno-strict-aliasing
CFLAGS+=$(CPPFLAGS)
RANLIB?=ranlib
RM?=rm -f

LIBPIDUTIL = libpidutil.a
HEADERS = pidutil.h
OBJECTS = pidutil.o

all: $(LIBPIDUTIL)

$(LIBPIDUTIL) : $(OBJECTS)
	$(AR) $(ARFLAGS) $(LIBPIDUTIL) $?
	$(RANLIB) $(LIBPIDUTIL)

install: all
	install -C $(LIBPIDUTIL) $(PREFIX)/lib
	install -C $(HEADERS) $(PREFIX)/include

clean:
	$(RM) *.o *.a a.out core temp.* $(LIBPIDUTIL)
	$(RM) -r *.dSYM
