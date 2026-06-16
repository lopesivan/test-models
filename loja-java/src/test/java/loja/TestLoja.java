package loja;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestLoja {

    @Test
    void carrinhoDeveSomarProdutos() {

        Carrinho carrinho = new Carrinho();

        carrinho.adicionar(new Produto("Livro", 50.0));
        carrinho.adicionar(new Produto("Caneta", 5.0));

        assertEquals(2, carrinho.quantidade());
        assertEquals(55.0, carrinho.total());
    }

    @Test
    void produtoDeveConterNomeEPreco() {

        Produto produto = new Produto("Livro", 50.0);

        assertEquals("Livro", produto.nome());
        assertEquals(50.0, produto.preco());
    }
}
