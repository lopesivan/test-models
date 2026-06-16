#include <assert.h>
#include "produto.h"
#include "carrinho.h"

int main(void) {
    Carrinho c;
    carrinho_init(&c);

    carrinho_adicionar(&c, produto_criar("Livro", 50.0));
    carrinho_adicionar(&c, produto_criar("Caneta", 5.0));

    assert(c.quantidade == 2);
    assert(carrinho_total(&c) == 55.0);

    return 0;
}
