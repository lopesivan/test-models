CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++20 -Isrc
BIN = loja-cpp

SRC = src/main.cpp src/produto.cpp src/carrinho.cpp

all:
	$(CXX) $(CXXFLAGS) $(SRC) -o $(BIN)

run: all
	./$(BIN)

clean:
	rm -f $(BIN)

.PHONY: all run clean
