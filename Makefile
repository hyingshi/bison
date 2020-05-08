all: parser

scanner.cpp: scanner.l
	flex -o scanner.cpp scanner.l

parser.cpp parser.hpp: parser.y
	bison -d -o parser.cpp parser.y

# scanner: scanner.cpp
# 	g++ scanner.cpp -o scanner

parser: parser.cpp parser.hpp scanner.cpp
	g++ parser.cpp scanner.cpp -o parser

clean:
	rm -f scanner scanner.cpp
