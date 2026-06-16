#include <assert.h>
#include <string.h>
#include "produto.h"

int main(void) {
    Produto p = produto_criar("Livro", 50.0);

    assert(strcmp(p.nome, "Livro") == 0);
    assert(p.preco == 50.0);

    return 0;
}
