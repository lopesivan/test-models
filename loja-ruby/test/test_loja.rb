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
