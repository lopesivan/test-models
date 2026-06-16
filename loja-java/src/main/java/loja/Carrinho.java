package loja;

import java.util.ArrayList;
import java.util.List;

public class Carrinho {
    private final List<Produto> produtos = new ArrayList<>();

    public void adicionar(Produto produto) {
        produtos.add(produto);
    }

    public double total() {
        double soma = 0.0;
        for (Produto p : produtos) {
            soma += p.getPreco();
        }
        return soma;
    }

    public int quantidade() {
        return produtos.size();
    }
}
