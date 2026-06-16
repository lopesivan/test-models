from loja import Produto

def test_produto():
    p = Produto("Livro", 50.0)

    assert p.nome == "Livro"
    assert p.preco == 50.0
