#include "produto.hpp"
#include "carrinho.hpp"

#include <cassert>

int main()
{
    Carrinho carrinho;

    carrinho.adicionar(Produto("Livro", 50.0));
    carrinho.adicionar(Produto("Caneta", 5.0));

    assert(carrinho.quantidade() == 2);
    assert(carrinho.total() == 55.0);

    return 0;
}
