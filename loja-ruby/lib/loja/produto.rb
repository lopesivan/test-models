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
