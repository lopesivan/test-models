#include "produto.hpp"

Produto::Produto(std::string nome, double preco)
    : nome_(std::move(nome)), preco_(preco) {}

const std::string& Produto::nome() const {
    return nome_;
}

double Produto::preco() const {
    return preco_;
}
