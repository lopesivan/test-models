from loja import Produto, Carrinho

def test_carrinho_total():
    c = Carrinho()

    c.adicionar(Produto("Livro", 50.0))
    c.adicionar(Produto("Caneta", 5.0))

    assert c.quantidade() == 2
    assert c.total() == 55.0
