#ifndef PRODUTO_HPP
#define PRODUTO_HPP

#include <string>

class Produto {
public:
    Produto(std::string nome, double preco);

    const std::string& nome() const;
    double preco() const;

private:
    std::string nome_;
    double preco_;
};

#endif
