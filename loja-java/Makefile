CURL = curl
HOST = http://localhost:8080

GRADLE = gradle

run:
	$(GRADLE) bootRun

test:
	$(GRADLE) test

build:
	$(GRADLE) build

clean:
	$(GRADLE) clean

deps:
	$(GRADLE) dependencies

curl-add:
	$(CURL) -s -X POST $(HOST)/carrinho/produtos \
		-H 'Content-Type: application/json' \
		-d '{"nome":"Livro","preco":50.0}' | jq .

curl-list:
	$(CURL) -s $(HOST)/carrinho | jq .

curl-total:
	$(CURL) -s $(HOST)/carrinho/total

curl-test:
	@echo "Adicionando produto..."
	$(CURL) -s -X POST $(HOST)/carrinho/produtos \
		-H 'Content-Type: application/json' \
		-d '{"nome":"Livro","preco":50.0}' | jq .
	@echo
	@echo "Listando carrinho..."
	$(CURL) -s $(HOST)/carrinho | jq .
	@echo
	@echo "Total:"
	$(CURL) -s $(HOST)/carrinho/total
	@echo

.PHONY: run test build clean deps curl-add curl-list curl-total curl-test
