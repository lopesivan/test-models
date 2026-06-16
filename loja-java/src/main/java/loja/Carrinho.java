package loja;

import java.util.ArrayList;
import java.util.List;

public class Carrinho {

    private final List<Produto> produtos = new ArrayList<>();

    public void adicionar(Produto produto) {
        produtos.add(produto);
    }

    public int quantidade() {
        return produtos.size();
    }

    public double total() {
        return produtos.stream()
                       .mapToDouble(Produto::preco)
                       .sum();
    }
}
