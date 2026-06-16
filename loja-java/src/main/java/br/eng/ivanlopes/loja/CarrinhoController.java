package br.eng.ivanlopes.loja;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/carrinho")
public class CarrinhoController {
    private final Carrinho carrinho = new Carrinho();

    public record CarrinhoResponse(
            List<Produto> produtos,
            int quantidade,
            double total
    ) {}

    private CarrinhoResponse response() {
        return new CarrinhoResponse(
                carrinho.produtos(),
                carrinho.quantidade(),
                carrinho.total()
        );
    }

    @PostMapping("/produtos")
    public CarrinhoResponse adicionar(@RequestBody Produto produto) {
        carrinho.adicionar(produto);
        return response();
    }

    @GetMapping
    public CarrinhoResponse listar() {
        return response();
    }

    @GetMapping("/total")
    public double total() {
        return carrinho.total();
    }
}
