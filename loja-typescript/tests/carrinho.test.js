const assert = require("node:assert");
const test = require("node:test");

const { Produto, Carrinho } = require("../dist/index");

test("carrinho soma produtos", () => {
  const carrinho = new Carrinho();

  carrinho.adicionar(new Produto("Livro", 50.0));
  carrinho.adicionar(new Produto("Caneta", 5.0));

  assert.strictEqual(carrinho.quantidade(), 2);
  assert.strictEqual(carrinho.total(), 55.0);
});
