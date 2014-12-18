LESS_FILES := $(wildcard src/less/*.less)
BIN:= ./node_modules/.bin
all: dist/app.min.js dist/main.min.css

build/main.css: $(LESS_FILES)
	$(BIN)/lessc src/less/main.less $@

dist/main.min.css: build/main.css
	$(BIN)/uglifycss $^ > $@

build/app.js: src/app.jsx
	$(BIN)/browserify -o $@ -t [ reactify --es6 ] $^

dist/app.min.js: build/app.js
	$(BIN)/uglifyjs $^ -o $@ --source-map $@.map -c -m

clean: 
	rm -f dist/app.min.js build/app.js build/main.css dist/main.min.css dist/app.min.js.map

test:
	node_modules/.bin/jest
