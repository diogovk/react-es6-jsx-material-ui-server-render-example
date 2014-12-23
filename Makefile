LESS_FILES := $(wildcard src/less/*.less)
JSX_COMPONENTS = $(wildcard src/components/*.jsx)
BIN:= ./node_modules/.bin

all: js
js: build/app.js public/index.html build/main.css
dist: dist/app.min.js dist/main.min.css

build/main.css: $(LESS_FILES)
	$(BIN)/lessc src/less/main.less $@

dist/main.min.css: build/main.css
	$(BIN)/uglifycss $^ > $@


build/app.js: src/app.jsx $(JSX_COMPONENTS)
	$(BIN)/browserify --standalone app -o $@ -t [ reactify --es6 ] $<

dist/app.min.js: build/app.js
	$(BIN)/uglifyjs $^ -o $@ --source-map $@.map -c -m

public/index.html: public/index.html.in build/app.js
	node server_compile.js

clean:
	rm -f dist/app.min.js build/app.js build/main.css dist/main.min.css dist/app.min.js.map public/index.html

test:
	node_modules/.bin/jest
