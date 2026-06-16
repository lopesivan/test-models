const assert = require("node:assert");
const test = require("node:test");

test("produto tem nome e preço", () => {
  const produto = { nome: "Livro", preco: 50.0 };

  assert.strictEqual(produto.nome, "Livro");
  assert.strictEqual(produto.preco, 50.0);
});
