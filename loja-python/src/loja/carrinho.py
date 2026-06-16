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
