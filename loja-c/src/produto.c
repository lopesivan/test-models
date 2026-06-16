#include "produto.h"
#include <string.h>

Produto produto_criar(const char *nome, double preco) {
    Produto p;
    strncpy(p.nome, nome, sizeof(p.nome) - 1);
    p.nome[sizeof(p.nome) - 1] = '\0';
    p.preco = preco;
    return p;
}
