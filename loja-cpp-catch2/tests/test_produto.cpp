#include "produto.hpp"

#include <cassert>
#include <string>

int main()
{
    Produto produto("Livro", 50.0);

    assert(produto.nome() == "Livro");
    assert(produto.preco() == 50.0);

    return 0;
}
