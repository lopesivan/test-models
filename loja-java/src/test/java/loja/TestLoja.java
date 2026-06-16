package loja;

public class TestLoja {
    public static void main(String[] args) {
        Carrinho carrinho = new Carrinho();

        carrinho.adicionar(new Produto("Livro", 50.0));
        carrinho.adicionar(new Produto("Caneta", 5.0));

        if (carrinho.quantidade() != 2) {
            throw new AssertionError("Quantidade deveria ser 2");
        }

        if (carrinho.total() != 55.0) {
            throw new AssertionError("Total deveria ser 55.0");
        }

        System.out.println("Todos os testes passaram.");
    }
}
