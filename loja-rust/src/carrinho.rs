use crate::produto::Produto;

#[derive(Debug, Default)]
pub struct Carrinho {
    produtos: Vec<Produto>,
}

impl Carrinho {
    pub fn new() -> Self {
        Self {
            produtos: Vec::new(),
        }
    }

    pub fn adicionar(&mut self, produto: Produto) {
        self.produtos.push(produto);
    }

    pub fn total(&self) -> f64 {
        self.produtos.iter().map(|p| p.preco).sum()
    }

    pub fn quantidade(&self) -> usize {
        self.produtos.len()
    }
}
