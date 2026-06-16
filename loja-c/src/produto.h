#ifndef PRODUTO_H
#define PRODUTO_H

typedef struct {
    char nome[64];
    double preco;
} Produto;

Produto produto_criar(const char *nome, double preco);

#endif
