PYTHON = python
PYTHONPATH = src

test:
	pytest

run:
	PYTHONPATH=$(PYTHONPATH) $(PYTHON) -m loja

clean:
	rm -rf .pytest_cache
	find . -name __pycache__ -type d -exec rm -rf {} +

.PHONY: test run clean
