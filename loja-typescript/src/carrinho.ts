import { Produto } from "./produto";

export class Carrinho {
  private produtos: Produto[] = [];

  adicionar(produto: Produto): void {
    this.produtos.push(produto);
  }

  total(): number {
    return this.produtos.reduce((soma, p) => soma + p.preco, 0);
  }

  quantidade(): number {
    return this.produtos.length;
  }
}
