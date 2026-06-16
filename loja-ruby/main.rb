require_relative "lib/loja/produto"
require_relative "lib/loja/carrinho"

carrinho = Loja::Carrinho.new
carrinho.adicionar(Loja::Produto.new("Livro", 50.0))
carrinho.adicionar(Loja::Produto.new("Caneta", 5.0))

puts "Quantidade: #{carrinho.quantidade}"
puts "Total: R$ #{carrinho.total}"
