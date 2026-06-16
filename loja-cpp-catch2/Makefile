CXX = g++
CXXFLAGS = -Wall -Wextra -Wpedantic -std=c++20 -Isrc

BIN = loja-cpp

SRC = \
	src/main.cpp \
	src/produto.cpp \
	src/carrinho.cpp

LIBSRC = \
	src/produto.cpp \
	src/carrinho.cpp

TESTS = \
	tests/test_produto \
	tests/test_carrinho

all:
	$(CXX) $(CXXFLAGS) $(SRC) -o $(BIN)

run: all
	./$(BIN)

tests/test_produto:
	$(CXX) $(CXXFLAGS) \
		tests/test_produto.cpp \
		$(LIBSRC) \
		-o $@

tests/test_carrinho:
	$(CXX) $(CXXFLAGS) \
		tests/test_carrinho.cpp \
		$(LIBSRC) \
		-o $@

test: $(TESTS)
	./tests/test_produto
	./tests/test_carrinho
	@echo "Todos os testes passaram."

clean:
	rm -f $(BIN)
	rm -f $(TESTS)

.PHONY: all run test clean
