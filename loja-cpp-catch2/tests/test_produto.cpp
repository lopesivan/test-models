#include <catch2/catch_test_macros.hpp>

#include "produto.hpp"

TEST_CASE("Produto possui nome e preco")
{
    Produto produto("Livro", 50.0);

    REQUIRE(produto.nome() == "Livro");
    REQUIRE(produto.preco() == 50.0);
}
