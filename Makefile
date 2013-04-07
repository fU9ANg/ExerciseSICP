##
## Makefile for sicp
##
## fU9ANg (bb.newlife@gmail.com)
##

INTERPRETER = guile
RACKET      = racket
RFLAGS      = -r

GFILES = chap1/e1.1.go     chap1/e1.2.go    chap1/e1.3.go    chap1/e1.4.go   chap1/e1.5.go    \
         chap1/e1.6.go     chap1/e1.7.go    chap1/e1.8.go    chap1/e1.9.go   chap1/e1.10.go   \
         chap1/e1.11.go    chap1/e1.12.go   chap1/e1.13.go   chap1/e1.14.go  chap1/e1.15.go   \
         chap1/e1.16.go    chap1/e1.17.go   chap1/e1.18.go   chap1/e1.19.go  chap1/e1.20.go   \
         chap1/e1.21.go    chap1/e1.22.go   chap1/e1.23.go   chap1/e1.24.go  chap1/e1.25.go   \
         chap1/e1.26.go    chap1/e1.27.go   chap1/e1.28.go   chap1/e1.29.go  chap1/e1.30.go   \
         chap1/e1.31.go    chap1/e1.32.go   chap1/e1.33.go   chap1/e1.34.go  chap1/e1.35.go   \
         chap1/e1.36.go    chap1/e1.37.go   chap1/e1.38.go   chap1/e1.39.go  chap1/e1.40.go   \
         chap1/e1.41.go    chap1/e1.42.go   chap1/e1.43.go   chap1/e1.44.go  chap1/e1.45.go   \
         chap1/e1.46.go

RFILES = chap1/e1.1.ra     chap1/e1.2.ra    chap1/e1.3.ra    chap1/e1.4.ra   chap1/e1.5.ra    \
         chap1/e1.6.ra     chap1/e1.7.ra    chap1/e1.8.ra    chap1/e1.9.ra   chap1/e1.10.ra   \
         chap1/e1.11.ra    chap1/e1.12.ra   chap1/e1.13.ra   chap1/e1.14.ra  chap1/e1.15.ra   \
         chap1/e1.16.ra    chap1/e1.17.ra   chap1/e1.18.ra   chap1/e1.19.ra  chap1/e1.20.ra   \
         chap1/e1.21.ra    chap1/e1.22.ra   chap1/e1.23.ra   chap1/e1.24.ra  chap1/e1.25.ra   \
         chap1/e1.26.ra    chap1/e1.27.ra   chap1/e1.28.ra   chap1/e1.29.ra  chap1/e1.30.ra   \
         chap1/e1.31.ra    chap1/e1.32.ra   chap1/e1.33.ra   chap1/e1.34.ra  chap1/e1.35.ra   \
         chap1/e1.36.ra    chap1/e1.37.ra   chap1/e1.38.ra   chap1/e1.39.ra  chap1/e1.40.ra   \
         chap1/e1.41.ra    chap1/e1.42.ra   chap1/e1.43.ra   chap1/e1.44.ra  chap1/e1.45.ra   \
         chap1/e1.46.ra

all: $(GFILES) $(RFILES)

%.go: %.scm
	$(INTERPRETER) $^

%.ra: %.scm
	$(RACKET) $(RFLAGS) $^
