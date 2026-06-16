CXX = g++

CXXFLAGS = \
	-Wall \
	-Wextra \
	-Wpedantic \
	-std=c++20 \
	-Isrc

BIN = loja-cpp

SRC = \
	src/main.cpp \
	src/produto.cpp \
	src/carrinho.cpp

LIBSRC = \
	src/produto.cpp \
	src/carrinho.cpp

TEST_BIN = tests/run-tests

TEST_SRC = \
	tests/main.cpp \
	tests/test_produto.cpp \
	tests/test_carrinho.cpp

all:
	$(CXX) $(CXXFLAGS) $(SRC) -o $(BIN)

run: all
	./$(BIN)

$(TEST_BIN):
	$(CXX) \
		$(CXXFLAGS) \
		$(TEST_SRC) \
		$(LIBSRC) \
		-o $(TEST_BIN)

test: $(TEST_BIN)
	./$(TEST_BIN)

clean:
	rm -f $(BIN)
	rm -f $(TEST_BIN)

.PHONY: all run test clean
