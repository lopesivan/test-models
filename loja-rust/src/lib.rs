pub mod produto;
pub mod carrinho;

pub use produto::Produto;
pub use carrinho::Carrinho;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn produto_deve_ter_nome_e_preco() {
        let produto = Produto::new("Livro", 50.0);

        assert_eq!(produto.nome, "Livro");
        assert_eq!(produto.preco, 50.0);
    }

    #[test]
    fn carrinho_deve_somar_produtos() {
        let mut carrinho = Carrinho::new();

        carrinho.adicionar(Produto::new("Livro", 50.0));
        carrinho.adicionar(Produto::new("Caneta", 5.0));

        assert_eq!(carrinho.quantidade(), 2);
        assert_eq!(carrinho.total(), 55.0);
    }
}
