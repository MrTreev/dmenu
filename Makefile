# dmenu - dynamic menu

.PHONY: all clean dist install uninstall dmenu_man stest_man dmenu dmenu_man stest stest_man man

all: dmenu stest man

include config.mk

$(SYS)/bin/dmenu: 
	mkdir -p $(BLD)
	$(CC) $(CFLAGS) -o $(BLD)/util.o -c $(SRC)/util.c
	$(CC) $(CFLAGS) -o $(BLD)/dmenu.o -c $(SRC)/dmenu.c
	$(CC) $(CFLAGS) -o $(BLD)/drw.o -c $(SRC)/drw.c
	mkdir -p $(SYS)/bin
	$(CC) $(LDFLAGS) -o $@ $(BLD)/dmenu.o $(BLD)/drw.o $(BLD)/util.o
	cp -f $(SRC)/scripts/dmenu_path $(SRC)/scripts/dmenu_run $(SYS)/bin
	chmod 755 $(SYS)/bin/dmenu_path
	chmod 755 $(SYS)/bin/dmenu_run
	chmod 755 $(SYS)/bin/dmenu

$(SYS)/bin/stest:
	mkdir -p $(BLD)
	$(CC) $(CFLAGS) -o $(BLD)/stest.o -c $(SRC)/stest.c
	mkdir -p $(SYS)/bin
	$(CC) $(LDFLAGS) -o $@ $(BLD)/stest.o
	chmod 755 $(SYS)/bin/stest

$(MANSYS)/man1/dmenu.1:
	mkdir -p $(MANSYS)/man1
	sed "s/VERSION/$(VERSION)/g" < $(MAN)/dmenu.1 > $(MANSYS)/man1/dmenu.1
	chmod 644 $(MANSYS)/man1/dmenu.1

$(MANSYS)/man1/stest.1:
	mkdir -p $(MANSYS)/man1
	sed "s/VERSION/$(VERSION)/g" < $(MAN)/stest.1 > $(MANSYS)/man1/stest.1
	chmod 644 $(MANSYS)/man1/stest.1

clean:
	rm -rf $(BLD) $(SYS)

install: all
	mkdir -p "$(DESTDIR)$(PREFIX)" "$(DESTDIR)$(MANPREFIX)"
	cp -ft $(DESTDIR)$(PREFIX)/bin \
		$(SYS)/bin/dmenu \
		$(SYS)/bin/dmenu_path \
		$(SYS)/bin/dmenu_run \
		$(SYS)/bin/stest \
		$(MANSYS)/man1/stest.1 \
		$(MANSYS)/man1/dmenu.1

uninstall:
	rm -f \
		$(DESTDIR)$(PREFIX)/bin/dmenu\
		$(DESTDIR)$(PREFIX)/bin/dmenu_path\
		$(DESTDIR)$(PREFIX)/bin/dmenu_run\
		$(DESTDIR)$(PREFIX)/bin/stest\
		$(DESTDIR)$(MANPREFIX)/man1/dmenu.1\
		$(DESTDIR)$(MANPREFIX)/man1/stest.1

dmenu: $(SYS)/bin/dmenu
stest: $(SYS)/bin/stest
dmenu_man: $(MANSYS)/man1/dmenu.1
stest_man: $(MANSYS)/man1/stest.1
man: dmenu_man stest_man
dist: clean
