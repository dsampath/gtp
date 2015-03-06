
.PHONY: default
default: Cookie

clean:
	-rm -rf gtp/Dockerfile ./Cookie-1 ./Cookie-2

Cookie: FORCE
	./$@

Cookie-1: FORCE
	-ln -s Cookie Cookie-1
	./$@

Cookie-2: FORCE
	-ln -s Cookie Cookie-2
	./$@

FORCE:
