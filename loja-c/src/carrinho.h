#ifndef CARRINHO_H
#define CARRINHO_H

#include "produto.h"

#define CARRINHO_MAX 128

typedef struct {
    Produto produtos[CARRINHO_MAX];
    int quantidade;
} Carrinho;

void carrinho_init(Carrinho *c);
void carrinho_adicionar(Carrinho *c, Produto p);
double carrinho_total(const Carrinho *c);

#endif
