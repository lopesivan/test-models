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
