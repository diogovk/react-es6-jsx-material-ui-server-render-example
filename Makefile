LESS_FILES := $(wildcard src/less/*.less)

all: dist/app.min.js dist/main.css

dist/main.css: $(LESS_FILES)
	./node_modules/.bin/lessc src/less/main.less $@


build/app.js: src/app.jsx
	./node_modules/.bin/browserify -o $@ -t [ reactify --es6 ] $^

dist/app.min.js: build/app.js
	./node_modules/.bin/uglifyjs $^ -o $@ --source-map $@.map -c -m

clean: dist/app.min.js build/app.js $(LESS_FILES)
	rm $^

test:
	node_modules/.bin/jest
