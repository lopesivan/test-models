#include <catch2/catch_test_macros.hpp>

#include "produto.hpp"
#include "carrinho.hpp"

TEST_CASE("Carrinho soma produtos")
{
    Carrinho carrinho;

    carrinho.adicionar(Produto("Livro", 50.0));
    carrinho.adicionar(Produto("Caneta", 5.0));

    REQUIRE(carrinho.quantidade() == 2);
    REQUIRE(carrinho.total() == 55.0);
}
