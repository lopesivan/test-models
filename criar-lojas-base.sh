#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# loja-c
# ============================================================

mkdir -p loja-c/src loja-c/tests

cat > loja-c/src/produto.h <<'C'
#ifndef PRODUTO_H
#define PRODUTO_H

typedef struct {
    char nome[64];
    double preco;
} Produto;

Produto produto_criar(const char *nome, double preco);

#endif
C

cat > loja-c/src/produto.c <<'C'
#include "produto.h"
#include <string.h>

Produto produto_criar(const char *nome, double preco) {
    Produto p;
    strncpy(p.nome, nome, sizeof(p.nome) - 1);
    p.nome[sizeof(p.nome) - 1] = '\0';
    p.preco = preco;
    return p;
}
C

cat > loja-c/src/carrinho.h <<'C'
#ifndef CARRINHO_H
#define CARRINHO_H

#include "produto.h"

#define CARRINHO_MAX 128

typedef struct {
    Produto produtos[CARRINHO_MAX];
    int quantidade;
} Carrinho;

void carrinho_init(Carrinho *c);
void carrinho_adicionar(Carrinho *c, Produto p);
double carrinho_total(const Carrinho *c);

#endif
C

cat > loja-c/src/carrinho.c <<'C'
#include "carrinho.h"

void carrinho_init(Carrinho *c) {
    c->quantidade = 0;
}

void carrinho_adicionar(Carrinho *c, Produto p) {
    if (c->quantidade < CARRINHO_MAX) {
        c->produtos[c->quantidade++] = p;
    }
}

double carrinho_total(const Carrinho *c) {
    double total = 0.0;

    for (int i = 0; i < c->quantidade; i++) {
        total += c->produtos[i].preco;
    }

    return total;
}
C

cat > loja-c/src/main.c <<'C'
#include <stdio.h>
#include "produto.h"
#include "carrinho.h"

int main(void) {
    Carrinho c;
    carrinho_init(&c);

    carrinho_adicionar(&c, produto_criar("Livro", 50.0));
    carrinho_adicionar(&c, produto_criar("Caneta", 5.0));

    printf("Quantidade: %d\n", c.quantidade);
    printf("Total: %.2f\n", carrinho_total(&c));

    return 0;
}
C

cat > loja-c/Makefile <<'MK'
CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -Isrc
BIN = loja-c

SRC = src/main.c src/produto.c src/carrinho.c

all:
	$(CC) $(CFLAGS) $(SRC) -o $(BIN)

run: all
	./$(BIN)

clean:
	rm -f $(BIN)

.PHONY: all run clean
MK

# ============================================================
# loja-cpp
# ============================================================

mkdir -p loja-cpp/src loja-cpp/tests

cat > loja-cpp/src/produto.hpp <<'CPP'
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
CPP

cat > loja-cpp/src/produto.cpp <<'CPP'
#include "produto.hpp"

Produto::Produto(std::string nome, double preco)
    : nome_(std::move(nome)), preco_(preco) {}

const std::string& Produto::nome() const {
    return nome_;
}

double Produto::preco() const {
    return preco_;
}
CPP

cat > loja-cpp/src/carrinho.hpp <<'CPP'
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
CPP

cat > loja-cpp/src/carrinho.cpp <<'CPP'
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
CPP

cat > loja-cpp/src/main.cpp <<'CPP'
#include "produto.hpp"
#include "carrinho.hpp"
#include <iostream>

int main() {
    Carrinho carrinho;

    carrinho.adicionar(Produto("Livro", 50.0));
    carrinho.adicionar(Produto("Caneta", 5.0));

    std::cout << "Quantidade: " << carrinho.quantidade() << '\n';
    std::cout << "Total: " << carrinho.total() << '\n';

    return 0;
}
CPP

cat > loja-cpp/Makefile <<'MK'
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++20 -Isrc
BIN = loja-cpp

SRC = src/main.cpp src/produto.cpp src/carrinho.cpp

all:
	$(CXX) $(CXXFLAGS) $(SRC) -o $(BIN)

run: all
	./$(BIN)

clean:
	rm -f $(BIN)

.PHONY: all run clean
MK

# ============================================================
# loja-python
# ============================================================

mkdir -p loja-python/src/loja loja-python/tests

cat > loja-python/pyproject.toml <<'PY'
[project]
name = "loja-python"
version = "0.1.0"
requires-python = ">=3.10"

[tool.pytest.ini_options]
pythonpath = ["src"]
PY

cat > loja-python/src/loja/__init__.py <<'PY'
from .produto import Produto
from .carrinho import Carrinho
PY

cat > loja-python/src/loja/produto.py <<'PY'
from dataclasses import dataclass

@dataclass
class Produto:
    nome: str
    preco: float
PY

cat > loja-python/src/loja/carrinho.py <<'PY'
from .produto import Produto

class Carrinho:
    def __init__(self):
        self._produtos: list[Produto] = []

    def adicionar(self, produto: Produto) -> None:
        self._produtos.append(produto)

    def total(self) -> float:
        return sum(p.preco for p in self._produtos)

    def quantidade(self) -> int:
        return len(self._produtos)
PY

cat > loja-python/tests/test_produto.py <<'PY'
from loja import Produto

def test_produto():
    p = Produto("Livro", 50.0)

    assert p.nome == "Livro"
    assert p.preco == 50.0
PY

cat > loja-python/tests/test_carrinho.py <<'PY'
from loja import Produto, Carrinho

def test_carrinho_total():
    c = Carrinho()

    c.adicionar(Produto("Livro", 50.0))
    c.adicionar(Produto("Caneta", 5.0))

    assert c.quantidade() == 2
    assert c.total() == 55.0
PY

cat > loja-python/Makefile <<'MK'
PYTHON = python

test:
	pytest

run:
	$(PYTHON) -c 'from loja import Produto, Carrinho; c=Carrinho(); c.adicionar(Produto("Livro",50)); c.adicionar(Produto("Caneta",5)); print(c.quantidade(), c.total())'

clean:
	rm -rf .pytest_cache
	rm -rf tests/__pycache__
	rm -rf src/loja/__pycache__

.PHONY: test run clean
MK

# ============================================================
# loja-rust
# ============================================================

mkdir -p loja-rust/src

cat > loja-rust/Cargo.toml <<'RS'
[package]
name = "loja-rust"
version = "0.1.0"
edition = "2021"

[dependencies]
RS

cat > loja-rust/src/produto.rs <<'RS'
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
RS

cat > loja-rust/src/carrinho.rs <<'RS'
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
RS

cat > loja-rust/src/lib.rs <<'RS'
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
RS

cat > loja-rust/src/main.rs <<'RS'
use loja_rust::{Carrinho, Produto};

fn main() {
    let mut c = Carrinho::new();

    c.adicionar(Produto::new("Livro", 50.0));
    c.adicionar(Produto::new("Caneta", 5.0));

    println!("Quantidade: {}", c.quantidade());
    println!("Total: {:.2}", c.total());
}
RS

cat > loja-rust/Makefile <<'MK'
run:
	cargo run

test:
	cargo test

clean:
	cargo clean

.PHONY: run test clean
MK

