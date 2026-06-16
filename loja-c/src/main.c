#include <stdio.h>
#include "produto.h"
#include "carrinho.h"

int main(void) {
    Carrinho c;
    carrinho_init(&c);

    carrinho_adicionar(&c, produto_criar("Livro", 50.0));
    carrinho_adicionar(&c, produto_criar("Caneta", 5.0));

    printf("Quantidade: %d\n", c.quantidade);
    printf("Total: %.2f\n", carrinho_total(&c));

    return 0;
}
