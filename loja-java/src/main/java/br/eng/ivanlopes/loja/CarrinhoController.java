package br.eng.ivanlopes.loja;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/carrinho")
public class CarrinhoController {
    private final Carrinho carrinho = new Carrinho();

    @PostMapping("/produtos")
    public Carrinho adicionar(@RequestBody Produto produto) {
        carrinho.adicionar(produto);
        return carrinho;
    }

    @GetMapping
    public Carrinho listar() {
        return carrinho;
    }

    @GetMapping("/total")
    public double total() {
        return carrinho.total();
    }
}
