#ifndef CARRINHO_HPP
#define CARRINHO_HPP

#include "produto.hpp"
#include <vector>

class Carrinho {
public:
    void adicionar(const Produto& produto);
    double total() const;
    std::size_t quantidade() const;

private:
    std::vector<Produto> produtos_;
};

#endif
