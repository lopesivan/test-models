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
