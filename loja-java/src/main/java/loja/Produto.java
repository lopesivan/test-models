package loja;

public class Produto {
    private final String nome;
    private final double preco;

    public Produto(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String nome() {
        return nome;
    }

    public double preco() {
        return preco;
    }
}
