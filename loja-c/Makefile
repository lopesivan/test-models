CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -Isrc
BIN = loja-c

SRC = src/main.c src/produto.c src/carrinho.c
LIBSRC = src/produto.c src/carrinho.c

TESTS = \
	tests/test_produto \
	tests/test_carrinho

all:
	$(CC) $(CFLAGS) $(SRC) -o $(BIN)

run: all
	./$(BIN)

tests/test_produto:
	$(CC) $(CFLAGS) tests/test_produto.c $(LIBSRC) -o $@

tests/test_carrinho:
	$(CC) $(CFLAGS) tests/test_carrinho.c $(LIBSRC) -o $@

test: $(TESTS)
	./tests/test_produto
	./tests/test_carrinho
	@echo "Todos os testes passaram."

clean:
	rm -f $(BIN)
	rm -f $(TESTS)

.PHONY: all run test clean

