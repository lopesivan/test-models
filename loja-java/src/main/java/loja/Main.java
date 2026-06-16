package loja;

public class Main {
    public static void main(String[] args) {
        Carrinho carrinho = new Carrinho();

        carrinho.adicionar(new Produto("Livro", 50.0));
        carrinho.adicionar(new Produto("Caneta", 5.0));

        System.out.println("Quantidade: " + carrinho.quantidade());
        System.out.println("Total: R$ " + carrinho.total());
    }
}
