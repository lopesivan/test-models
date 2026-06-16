use loja_rust::{Carrinho, Produto};

fn main() {
    let mut c = Carrinho::new();

    c.adicionar(Produto::new("Livro", 50.0));
    c.adicionar(Produto::new("Caneta", 5.0));

    println!("Quantidade: {}", c.quantidade());
    println!("Total: {:.2}", c.total());
}
