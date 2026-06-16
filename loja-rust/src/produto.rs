#[derive(Debug, Clone)]
pub struct Produto {
    pub nome: String,
    pub preco: f64,
}

impl Produto {
    pub fn new(nome: &str, preco: f64) -> Self {
        Self {
            nome: nome.to_string(),
            preco,
        }
    }
}
