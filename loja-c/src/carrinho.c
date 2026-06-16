#include "carrinho.h"

void carrinho_init(Carrinho *c) {
    c->quantidade = 0;
}

void carrinho_adicionar(Carrinho *c, Produto p) {
    if (c->quantidade < CARRINHO_MAX) {
        c->produtos[c->quantidade++] = p;
    }
}

double carrinho_total(const Carrinho *c) {
    double total = 0.0;

    for (int i = 0; i < c->quantidade; i++) {
        total += c->produtos[i].preco;
    }

    return total;
}
