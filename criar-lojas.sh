#!/usr/bin/env bash
set -e

# =========================
# loja-typescript
# =========================
mkdir -p loja-typescript/src loja-typescript/tests

cat > loja-typescript/package.json <<'PKG'
{
  "scripts": {
    "test": "node --test tests/*.test.js"
  },
  "devDependencies": {
    "typescript": "^5.0.0"
  }
}
PKG

cat > loja-typescript/tsconfig.json <<'TS'
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "CommonJS",
    "strict": true,
    "outDir": "dist"
  },
  "include": ["src"]
}
TS

cat > loja-typescript/src/produto.ts <<'TS'
export class Produto {
  constructor(
    public nome: string,
    public preco: number
  ) {}

  toString(): string {
    return `${this.nome} - R$ ${this.preco.toFixed(2)}`;
  }
}
TS

cat > loja-typescript/src/carrinho.ts <<'TS'
import { Produto } from "./produto";

export class Carrinho {
  private produtos: Produto[] = [];

  adicionar(produto: Produto): void {
    this.produtos.push(produto);
  }

  total(): number {
    return this.produtos.reduce((soma, p) => soma + p.preco, 0);
  }

  quantidade(): number {
    return this.produtos.length;
  }
}
TS

# =========================
# loja-java
# =========================
mkdir -p loja-java/src/main/java/loja loja-java/src/test/java/loja

cat > loja-java/src/main/java/loja/Produto.java <<'JAVA'
package loja;

public class Produto {
    private final String nome;
    private final double preco;

    public Produto(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    @Override
    public String toString() {
        return nome + " - R$ " + String.format("%.2f", preco);
    }
}
JAVA

cat > loja-java/src/main/java/loja/Carrinho.java <<'JAVA'
package loja;

import java.util.ArrayList;
import java.util.List;

public class Carrinho {
    private final List<Produto> produtos = new ArrayList<>();

    public void adicionar(Produto produto) {
        produtos.add(produto);
    }

    public double total() {
        double soma = 0.0;
        for (Produto p : produtos) {
            soma += p.getPreco();
        }
        return soma;
    }

    public int quantidade() {
        return produtos.size();
    }
}
JAVA

cat > loja-java/src/main/java/loja/Main.java <<'JAVA'
package loja;

public class Main {
    public static void main(String[] args) {
        Carrinho carrinho = new Carrinho();

        carrinho.adicionar(new Produto("Livro", 50.0));
        carrinho.adicionar(new Produto("Caneta", 5.0));

        System.out.println("Quantidade: " + carrinho.quantidade());
        System.out.println("Total: R$ " + carrinho.total());
    }
}
JAVA

cat > loja-java/Makefile <<'MK'
JAVAC = javac
JAVA  = java
SRC   = src/main/java
OUT   = build

all:
	mkdir -p $(OUT)
	$(JAVAC) -d $(OUT) $(SRC)/loja/*.java

run: all
	$(JAVA) -cp $(OUT) loja.Main

clean:
	rm -rf $(OUT)

.PHONY: all run clean
MK

# =========================
# loja-ruby
# =========================
mkdir -p loja-ruby/lib/loja loja-ruby/test

cat > loja-ruby/lib/loja/produto.rb <<'RB'
module Loja
  class Produto
    attr_reader :nome, :preco

    def initialize(nome, preco)
      @nome = nome
      @preco = preco
    end

    def to_s
      "#{@nome} - R$ #{format('%.2f', @preco)}"
    end
  end
end
RB

cat > loja-ruby/lib/loja/carrinho.rb <<'RB'
require_relative "produto"

module Loja
  class Carrinho
    def initialize
      @produtos = []
    end

    def adicionar(produto)
      @produtos << produto
    end

    def total
      @produtos.sum(&:preco)
    end

    def quantidade
      @produtos.size
    end
  end
end
RB

cat > loja-ruby/main.rb <<'RB'
require_relative "lib/loja/produto"
require_relative "lib/loja/carrinho"

carrinho = Loja::Carrinho.new
carrinho.adicionar(Loja::Produto.new("Livro", 50.0))
carrinho.adicionar(Loja::Produto.new("Caneta", 5.0))

puts "Quantidade: #{carrinho.quantidade}"
puts "Total: R$ #{carrinho.total}"
RB

cat > loja-ruby/test/test_loja.rb <<'RB'
require "minitest/autorun"
require_relative "../lib/loja/produto"
require_relative "../lib/loja/carrinho"

class LojaTest < Minitest::Test
  def test_total_do_carrinho
    carrinho = Loja::Carrinho.new
    carrinho.adicionar(Loja::Produto.new("Livro", 50.0))
    carrinho.adicionar(Loja::Produto.new("Caneta", 5.0))

    assert_equal 2, carrinho.quantidade
    assert_equal 55.0, carrinho.total
  end
end
RB

