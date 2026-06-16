#include "carrinho.hpp"

void Carrinho::adicionar(const Produto& produto) {
    produtos_.push_back(produto);
}

double Carrinho::total() const {
    double soma = 0.0;

    for (const auto& p : produtos_) {
        soma += p.preco();
    }

    return soma;
}

std::size_t Carrinho::quantidade() const {
    return produtos_.size();
}
