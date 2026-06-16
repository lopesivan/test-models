#include "produto.hpp"
#include "carrinho.hpp"
#include <iostream>

int main() {
    Carrinho carrinho;

    carrinho.adicionar(Produto("Livro", 50.0));
    carrinho.adicionar(Produto("Caneta", 5.0));

    std::cout << "Quantidade: " << carrinho.quantidade() << '\n';
    std::cout << "Total: " << carrinho.total() << '\n';

    return 0;
}
