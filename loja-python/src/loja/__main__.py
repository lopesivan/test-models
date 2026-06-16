from loja import Produto, Carrinho

carrinho = Carrinho()

carrinho.adicionar(Produto("Livro", 50.0))
carrinho.adicionar(Produto("Caneta", 5.0))

print(f"Quantidade: {carrinho.quantidade()}")
print(f"Total: {carrinho.total()}")
