pub mod produto;
pub mod carrinho;

pub use produto::Produto;
pub use carrinho::Carrinho;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn carrinho_soma_produtos() {
        let mut c = Carrinho::new();

        c.adicionar(Produto::new("Livro", 50.0));
        c.adicionar(Produto::new("Caneta", 5.0));

        assert_eq!(c.quantidade(), 2);
        assert_eq!(c.total(), 55.0);
    }
}
