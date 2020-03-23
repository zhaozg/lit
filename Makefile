APP_FILES=$(shell find . -name '*.lua')
LUVI_ARCH=$(shell uname -s)-$(shell uname -m)
LUVI_VERSION=2.9.3
LUVI_URL=$(HOME)/work/release/luvi/luvi-$(LUVI_ARCH)

lit: $(APP_FILES)
	echo $(LUVI_URL)
	$(LUVI_URL) . -- make . lit $(LUVI_URL)

test: lit
	tests/run.sh

clean:
	git clean -xdf

install: lit
	install lit /usr/local/bin

deploy: lit
	sudo systemctl stop lit
	install lit /usr/local/bin
	sudo systemctl start lit

uninstall:
	rm -f /usr/local/bin/lit

lint:
	luacheck $(APP_FILES)
