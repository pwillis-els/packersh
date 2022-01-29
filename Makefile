all: lint test-main readme

.PHONY: test test-main test-extensions lint readme
test: test-main test-extensions

test-main:
	export PATH="`pwd`:$$PATH" ; \
    ./test.sh tests/*.t

docker-test-main-build:
	make -C .github/actions/test-with-docker docker-build

docker-test-main-run: docker-test-main-build
	make -C .github/actions/test-with-docker docker-run


lint:
	shellcheck packersh

readme:
	cat README.md.tmpl > README.md
	./packersh -h >> README.md ; true
