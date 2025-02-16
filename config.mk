# dmenu version
VERSION    = 5.0
BINNAME    = dmenu
# paths
BLD        = bld
SRC        = src
MAN        = man
SYS        = sys
PREFIX     = /usr/local
MANDIR     = share/man
WATCH      = ${SRC}/config.h
DEPS       = ${SRC}/util.c ${SRC}/drw.c
TOINSTALL  = 
SYSTEM     = $(shell hostname)

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/include/freetype2
# OpenBSD {uncomment}
#FREETYPEINC = ${X11INC}/freetype2

# includes and libs
INCS = -I${X11INC} -I${FREETYPEINC}
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS} -lXrender

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
LDFLAGS  = ${LIBS}

# compiler and linker
CC = cc

ifeq ("${SYSTEM}", "ThiccStation")
	CFLAGS += -DFONT_DEF='"Hack Nerd Font Mono:pixelsize=16:antialias=true:autohint=true"'
else ifeq ("${SYSTEM}", "thiccpad")
	CFLAGS += -DFONT_DEF='"Hack Nerd Font Mono:pixelsize=14:antialias=true:autohint=true"'
else
	CFLAGS += -DFONT_DEF='"Hack Nerd Font Mono:pixelsize=12:antialias=true:autohint=true"'
endif
