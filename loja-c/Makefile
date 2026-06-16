CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -Isrc
BIN = loja-c

SRC = src/main.c src/produto.c src/carrinho.c

all:
	$(CC) $(CFLAGS) $(SRC) -o $(BIN)

run: all
	./$(BIN)

clean:
	rm -f $(BIN)

.PHONY: all run clean
