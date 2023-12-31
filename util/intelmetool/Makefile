# SPDX-License-Identifier: GPL-2.0-or-later

PROGRAM = intelmetool

TOP     ?= $(abspath ../..)
CC      ?= gcc
INSTALL ?= /usr/bin/env install
PREFIX  ?= /usr/local
CFLAGS  ?= -O0 -g -Wall -Wextra -Wno-unused-parameter -Wno-sign-compare -Wno-unused-function \
           -I $(TOP)/src/commonlib/bsd/include
LDFLAGS += -lpci -lz

OBJS = intelmetool.o me.o me_status.o mmap.o rcba.o msr.o

OS_ARCH	= $(shell uname)
ifeq ($(OS_ARCH), Darwin)
LDFLAGS += -framework DirectHW
endif
ifeq ($(OS_ARCH), FreeBSD)
CFLAGS += -I/usr/local/include
LDFLAGS += -L/usr/local/lib
LIBS = -lz
endif
ifeq ($(OS_ARCH), NetBSD)
CFLAGS += -I/usr/pkg/include
LDFLAGS += -L/usr/pkg/lib -Wl,-rpath-link,/usr/pkg/lib -lz -lpciutils -lpci -l$(shell uname -p)
endif

all: pciutils dep $(PROGRAM)

oldarc: CFLAGS += -DOLDARC
oldarc: all

$(PROGRAM): $(OBJS)
	$(CC) $(CFLAGS) -o $(PROGRAM) $(OBJS) $(LDFLAGS)

clean:
	rm -f $(PROGRAM) *.o *~ junit.xml

distclean: clean
	rm -f .dependencies

dep:
	@$(CC) $(CFLAGS) -MM *.c > .dependencies

define LIBPCI_TEST
/* Avoid a failing test due to libpci header symbol shadowing breakage */
#define index shadow_workaround_index
#ifdef __NetBSD__
#include <pciutils/pci.h>
#else
#include <pci/pci.h>
#endif
struct pci_access *pacc;
int main(int argc, char **argv)
{
	(void) argc;
	(void) argv;
	pacc = pci_alloc();
	return 0;
}
endef
export LIBPCI_TEST

pciutils:
	@printf "\nChecking for development libraries: pci and zlib... "
	@echo "$$LIBPCI_TEST" > .test.c
	@$(CC) $(CFLAGS) .test.c -o .test $(LDFLAGS) >/dev/null 2>&1 &&	  \
		printf "found.\n" || ( printf "not found.\n\n"; 	  \
		printf "For RPM based distributions like Fedora, please install pciutils-devel and zlib-devel.\n"; \
		printf "For DEB based distributions, please install libpci-dev and zlib1g-dev.\n"; \
		rm -f .test.c .test; exit 1)
	@rm -rf .test.c .test .test.dSYM

install: $(PROGRAM)
	mkdir -p $(DESTDIR)$(PREFIX)/sbin
	$(INSTALL) $(PROGRAM) $(DESTDIR)$(PREFIX)/sbin

.PHONY: all clean distclean dep pciutils oldarc

-include .dependencies
