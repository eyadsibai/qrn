PREFIX = /usr/local

qrn: qrn.sh qrn.awk qrn.tsv
	cat qrn.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz qrn.awk qrn.tsv >> $@
	chmod +x $@

test: qrn.sh
	shellcheck -s sh qrn.sh

clean:
	rm -f qrn

install: qrn
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f qrn $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/qrn

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/qrn

.PHONY: test clean install uninstall
