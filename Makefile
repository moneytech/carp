CC = clang #/usr/local/bin/gcc-4.2
NDEBUG ?= 
CFLAGS = -c -std=c99 -Wall -Werror -Wno-unused-variable -O3 -static $(NDEBUG) 
SRCS = $(wildcard *.c lib/*.c)
OBJS = *.o
PROG = carp

# all:
# 	$(CC) $(CFLAGS) $(SRCS)
# 	$(CC) $(OBJS) -o $(PROG)
# 	make clean_objs

all:
	make objs

objs:
	$(CC) $(CFLAGS) $(SRCS)
	ar cr libcarp.a $(OBJS)
	make clean_objs

uninstall:
	rm -rf /usr/local/include/carp

install:
	make uninstall
	mkdir /usr/local/include/carp
	cp -r . /usr/local/include/carp

clean_objs:
	find . -name "*.o"	\
	-o -name "*.out"	\
	-o -name "*.a"		\
	 | xargs rm -f

clean:
	make clean_objs
	rm -f $(PROG)
